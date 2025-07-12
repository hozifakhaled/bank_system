import 'package:bank_system/core/themeing/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? bordercolor;
  final Color? textcolor;
  final Color? buttonbodycolor;
  final void Function()? onTap;
  final Widget? child;
  final FontWeight? fontWeight;
  final bool isLoading;

  const CustomButton({
    super.key,
    this.text,
    this.onTap,
    this.bordercolor,
    this.textcolor,
    this.buttonbodycolor,
    this.fontWeight,
    this.child,
    this.isLoading = false, // الافتراضي: غير مفعل
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap, // منع الضغط أثناء التحميل
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: bordercolor ?? maincolor),
          color: buttonbodycolor ?? maincolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 22.w,
                  height: 22.h,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : child ??
                  Text(
                    text ?? '',
                    style: TextStyle(
                      color: textcolor ?? Colors.white,
                      fontSize: 16.sp,
                      fontWeight: fontWeight ?? FontWeight.bold,
                    ),
                  ),
        ),
      ),
    );
  }
}
