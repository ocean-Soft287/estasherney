import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/doctors_widget.dart';
import '../widget/doctorspecialization_info.dart';
import '../widget/header_container.dart';
import '../widget/toggle_buttons_row.dart';


class Favourites extends StatefulWidget { // تغيير من StatelessWidget إلى StatefulWidget
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderContainer(title: "المفضل"),
            SizedBox(height: 20),

            ToggleButtonsRow(isDoctor: isDoctor, onToggle: toggleSelection),

            Padding(padding: const EdgeInsets.all(8.0), child: Divider()),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return isDoctor
                      ? DoctorsWidget()
                      : DoctorspecializationInfo();
                },
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 5.h);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
