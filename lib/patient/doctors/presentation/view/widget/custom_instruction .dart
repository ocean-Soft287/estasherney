import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomInstruction extends StatelessWidget {
  CustomInstruction({super.key});
  
  final List<Map<String, dynamic>> contactItems = [
    {'title': 'خدمة العملاء', 'icon': Icons.headset_mic},
    {'title': 'الموقع', 'icon': Icons.language},
    {'title': 'واتس اب', 'icon': FontAwesomeIcons.whatsapp},
    {'title': 'فيس بوك', 'icon': FontAwesomeIcons.facebook},
    {'title': 'انستجرام', 'icon': FontAwesomeIcons.instagram},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Add this
      physics: NeverScrollableScrollPhysics(), // Add this to prevent nested scrolling
      itemCount: contactItems.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(
              contactItems[index]['title'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(contactItems[index]['icon'], color: Colors.deepPurple),
            trailing: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple),
          ),
        );
      },
    );
  }
}