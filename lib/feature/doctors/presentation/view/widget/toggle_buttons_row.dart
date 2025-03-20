import 'package:flutter/cupertino.dart';
import 'custom_toggle_button.dart';

class ToggleButtonsRow extends StatelessWidget {
  final bool isDoctor;
  final ValueChanged<bool> onToggle;

  const ToggleButtonsRow({super.key, required this.isDoctor, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Spacer(),
          CustomToggleButton(
            text: "الأطباء",
            isSelected: isDoctor,
            onTap: () => onToggle(true),
          ),
          Spacer(),
          CustomToggleButton(
            text: "الخدمات",
            isSelected: !isDoctor,
            onTap: () => onToggle(false),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
