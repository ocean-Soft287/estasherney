

import 'package:consult_me/feature/doctors/presentation/view/widget/custom_toggle_button.dart';
import 'package:flutter/material.dart';

class Custombootom extends StatelessWidget {
   final bool center;
  final ValueChanged<bool> sevivses;
  const Custombootom({super.key, required this.center, required this.sevivses});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Spacer(),
          CustomToggleButton(
            text: "اتصل بنا",
            isSelected: center,
            onTap: () => sevivses(true),
          ),
          Spacer(),
          CustomToggleButton(
            text: "التعليمات",
            isSelected: !center,
            onTap: () => sevivses(false),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
  
