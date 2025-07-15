import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/core/widgets/custom_textfield.dart';
import 'package:bank_system/features/home/presentation/manegar/deposit_cubit/cubit/deposit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomBottomSheetDiposit extends StatefulWidget {
  const CustomBottomSheetDiposit({super.key});

  @override
  State<CustomBottomSheetDiposit> createState() => _CustomBottomSheetDipositState();
}

class _CustomBottomSheetDipositState extends State<CustomBottomSheetDiposit> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Give focus to the textfield when bottom sheet opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DepositCubit, DepositState>(
      listener: (context, state) {
        if (state is DepositSuccess) {
          GoRouter.of(context).push(Routes.dataDepositAndWithdraw, extra: state.depositEntity);
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(20.w),
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 5.h,
                  margin: EdgeInsets.only(bottom: 20.h),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
              ),
              CustomTextformfield(
                hintText: 'Enter Your Amount',
                keyboardType: TextInputType.number,
                controller: context.read<DepositCubit>().amountController,
                focusNode: _focusNode, // ✅ add this
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: const Color(0xFF6366F1),
                          width: 1.5.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: const Color(0xFF6366F1),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final amountText = context.read<DepositCubit>().amountController.text;
                        final amount = double.tryParse(amountText) ?? 0.0;
                        context.read<DepositCubit>().createDeposit(amount);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        elevation: 0,
                      ),
                      child: state is DepositLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Confirm',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
