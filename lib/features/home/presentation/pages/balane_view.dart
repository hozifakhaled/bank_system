import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/core/widgets/custom_button.dart';
import 'package:bank_system/features/home/presentation/manegar/balance_cubit/balance_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bank_system/core/themeing/colors.dart';
import 'package:go_router/go_router.dart';

class BalanceView extends StatelessWidget {
  const BalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BalanceCubit>()..getBalance(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Account Balance'),
          backgroundColor: Colors.white,
          foregroundColor: maincolor,
          elevation: 0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              children: [
                // Balance Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Your Balance',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      BlocBuilder<BalanceCubit, BalanceState>(
                        builder: (context, state) {
                          if (state is BalanceLoaded) {
                            return Text(
                              '\$${state.balance.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 36.sp,
                                fontWeight: FontWeight.bold,
                                color: maincolor,
                              ),
                            );
                          } else if (state is BalanceError) {
                            return Text(
                              state.errMessage,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return SizedBox(
                              width: 30.w,
                              height: 30.h,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.w,
                                color: maincolor,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Done Button
                CustomButton(
                  buttonbodycolor: maincolor,
                  textcolor: Colors.white,
                  text: 'Done',
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
