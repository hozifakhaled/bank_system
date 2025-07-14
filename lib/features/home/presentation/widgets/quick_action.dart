import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/core/themeing/colors.dart';
import 'package:bank_system/features/home/presentation/manegar/home_cubit/home_cubit.dart';
import 'package:bank_system/features/home/presentation/widgets/quick_action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: BlocProvider(
        create: (context) => sl<HomeCubit>(),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            // Replace data dynamically if needed
            return Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: QuickActionItem(
                icon: Icons.send,
                label: "Transfer",
                iconColor: maincolor,
              ),
            );
          },
        ),
      ),
    );
  }
}
