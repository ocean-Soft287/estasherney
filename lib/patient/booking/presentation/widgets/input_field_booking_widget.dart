import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final int maxLines;
 final TextEditingController controller;
  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    this.keyboardType,
    this.maxLines = 1, required this.controller,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.leagueSpartan(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.mainColor,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
           
            onChanged: (text){

              setState(() {
                widget.controller.text = text;
                });    },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'برجاء ادخال البيانات';
              }
              return null;
            },
            decoration: InputDecoration(
               suffixIcon:widget.controller.text.isNotEmpty ? IconButton(
                icon: Icon(Icons.close,color: AppColors.mainColor,),
                onPressed: () {
              setState(() {
                widget.controller.clear();
              });
            })
           : null,
              
              hintText: widget.hintText,
              hintStyle: GoogleFonts.leagueSpartan(
                color: Colors.grey.shade600,
                fontSize: 14.sp,
              ),
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.mainColor, width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
            style: GoogleFonts.leagueSpartan(
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
