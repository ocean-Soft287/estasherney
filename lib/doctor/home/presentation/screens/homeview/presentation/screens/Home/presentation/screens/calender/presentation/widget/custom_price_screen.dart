import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/logic/pricedoctor/price_doctor_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/logic/pricedoctor/price_doctor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class CustomPriceScreen extends StatefulWidget {
  final double price; // ✅ السعر بيتبعت من برا

  const CustomPriceScreen({super.key, required this.price});

  @override
  State<CustomPriceScreen> createState() => _CustomPriceScreenState();
}

class _CustomPriceScreenState extends State<CustomPriceScreen> {
  late final PriceCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = GetIt.I<PriceCubit>();
    cubit.fetchDoctorPrice(widget.price);
  }

  @override
  void didUpdateWidget(covariant CustomPriceScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.price != widget.price) {
      cubit.fetchDoctorPrice(widget.price); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<PriceCubit, PriceState>(
        builder: (context, state) {
          if (state is PriceLoading) {
            return const CircularProgressIndicator();
          } else if (state is PriceFailure) {
            return Text(
              'فشل: ${state.message}',
              style: TextStyle(color: Colors.red, fontSize: 16.sp),
            );
          } else if (state is PriceSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.savings, size: 18, color: AppColors.mainColor),
                SizedBox(width: 5.w),
                Text(
                  'تتحصل علي${state.priceModel.price.toStringAsFixed(2)} جنيه',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
