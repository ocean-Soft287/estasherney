import 'package:consult_me/patient/doctors/presentation/view/widget/custom_instruction%20.dart';
import 'package:consult_me/patient/doctors/presentation/view/widget/help_speslization.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/widget/customBootom.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/widget/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  bool isDoctor = true;

  void toggleSelection(bool value) {
    if (isDoctor != value) {
      setState(() {
        isDoctor = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
        
              Column(
                children: [
                  CustomBackground(),
                  SizedBox(height: 20.h),
                  Custombootom(center: isDoctor, sevivses: toggleSelection),
                  Divider(),
                ],
              ),

            
              Expanded(
                child:
                    isDoctor
                        ? CustomInstruction()
                        : ListView.separated(
                          itemCount: 3,
                          itemBuilder: (context, index) => HelpSpeslization(),
                          separatorBuilder:
                              (context, index) => SizedBox(height: 5.h),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
