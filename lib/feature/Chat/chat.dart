import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consult_me/feature/Chat/image_message.dart';
import 'package:consult_me/feature/Chat/text_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChatPage extends StatelessWidget {
  final CollectionReference messages =
      FirebaseFirestore.instance.collection("messages");

  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  ChatPage({super.key});

  void _sendMessage(String text, User? user) {
    if (text.trim().isEmpty) return;

    messages.add({
      "text": text,
      "sender": user?.uid ?? "anonymous",
      "type": "text",
      "timestamp": DateTime.now(),
    });

    _controller.clear();
  }

  Future<void> _sendImage(User? user, File imageFile) async {
    final String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
    final Reference ref = FirebaseStorage.instance.ref().child("chat_images/$fileName");

    await ref.putFile(imageFile);
    final String downloadUrl = await ref.getDownloadURL();

    messages.add({
      "text": downloadUrl,
      "sender": user?.uid ?? "anonymous",
      "type": "image",
      "timestamp": DateTime.now(),
    });
  }

  Future<void> _pickImage(User? user) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      await _sendImage(user, File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Realtime Chat"),
        actions: [
          IconButton(
            icon: Icon(Icons.image),
            onPressed: () => _pickImage(user),
          ),
        ],
      ),
      body:
       Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messages.orderBy("timestamp").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final List<DocumentSnapshot> docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    final isMe = data["sender"] == user?.uid;

                    if (data["type"] == "text") {
                      return TextMessageBubble(text: data["text"], isMe: isMe);
                    } else if (data["type"] == "image") {
                      return ImageMessageBubble(imageUrl: data["text"], isMe: isMe);
                    }

                    return SizedBox.shrink();
                  },
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text, user),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



