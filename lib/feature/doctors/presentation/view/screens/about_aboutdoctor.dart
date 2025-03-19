import 'package:flutter/material.dart';

class AboutAboutdoctor extends StatelessWidget {
  const AboutAboutdoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
        
              width: MediaQuery.sizeOf(context).width,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF4D1BD8).withOpacity(1.0), // Fully opaque
                    const Color(0xFF00BBD3).withOpacity(0.5), // 50% opacity
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
        
              ),
            child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
          Icon(Icons.arrow_back_ios_new),

          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.white,child: Image.asset("assets/icons/call.png",width: 50,height: 50,)),
              CircleAvatar(backgroundColor: Colors.white,child: Image.asset("assets/icons/call.png",width: 50,height: 50,)),
              CircleAvatar(backgroundColor: Colors.white,child: Image.asset("assets/icons/call.png",width: 50,height: 50,)),
            ],
          ),

              ],
            ),
          ),
        )
        
            ],),
            )
        
        
        
          ],),
        ),
      ) ,


    );
  }
}
