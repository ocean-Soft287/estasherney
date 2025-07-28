import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/rating_summary_cubit.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/rating_summary_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRow extends StatefulWidget {
  final int doctorId;

  const CustomRow({super.key, required this.doctorId});

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorRatingCubit>().getDoctorRating(widget.doctorId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRatingCubit, DoctorRatingState>(
      builder: (context, state) {
        double averageRating = 0.0;

        if (state is DoctorRatingLoaded) {
          averageRating = state.summary.averageRating;
        }

        return Row(
          children: [
            Icon(Icons.star, color: AppColors.mainColor, size: 18),
            SizedBox(width: 4),
            Text(averageRating.toStringAsFixed(1)),
          ],
        );
      },
    );
  }
}
