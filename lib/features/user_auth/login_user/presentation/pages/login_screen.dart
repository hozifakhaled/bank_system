import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/core/themeing/colors.dart';
import 'package:bank_system/features/user_auth/login_user/presentation/cubit/login_user_cubit.dart';
import 'package:bank_system/features/user_auth/login_user/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginUserCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true, // مهم علشان الكيبورد
        backgroundColor: Colors.grey.shade50,
       body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, maincolor.withOpacity(0.05)],
          ),
        ),
        child: SafeArea(child: Stack(children: [
          Positioned(
                top: -100.h,
                right: -100.w,
                child: Container(
                  height: 300.w,
                  width: 300.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        maincolor.withOpacity(0.1),
                        maincolor.withOpacity(0.05),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -150.h,
                left: -150.w,
                child: Container(
                  height: 350.w,
                  width: 350.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        maincolor.withOpacity(0.08),
                        maincolor.withOpacity(0.03),
                      ],
                    ),
                  ),
                ),
              ),

          
          LoginBodyView()])),
      ),
      ),
    );
  }
}
