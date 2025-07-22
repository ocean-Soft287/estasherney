import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_state.dart';
import 'package:consult_me/feature/home/presentation/views/widget/speciality_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key});

  final List<Map<String, dynamic>> specialties = [
    {"image": "assets/images/Component 29 (2).png"},
    {"image": "assets/images/Component 29 (1).png"},
    {"image": "assets/images/Component 29.png"},
    {"image": "assets/images/Component 29 (5).png"},
    {"image": "assets/images/Component 29 (4).png"},
    {"image": "assets/images/Component 29 (3).png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final cubit = GetIt.instance<GetAllSpecialistCubit>();
          cubit.getAllSpecialistDoctor();
          return cubit;
        },
        child: BlocConsumer<GetAllSpecialistCubit, GetAllSpecialistState>(
          listener: (context, state) {
            if (state is GetAllSpecialistFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            if (state is GetAllSpecialistLoading) {
             
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is GetAllSpecialistSuccess) {
              final specialists = state.specialist;

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return SpecialtyCard(
                          imagePath: specialties[index]["image"],
                          label:
                              index < specialists.length
                                  ? specialists[index].name
                                  : "Specialty ${index + 1}",
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
