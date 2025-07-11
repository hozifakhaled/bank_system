import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final int? maxLines;
  final double? cursorHeight;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final Color? color;
  final Color? colorborder;
  final InputBorder? border;
 final int? minLines;
 final Widget? prefix;
  final Widget? prefixIcon;
  const CustomTextformfield({
    super.key,
    this.prefix,
    this.prefixIcon,
    required this.hintText,
    required this.keyboardType,
    this.controller,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.maxLines,
    this.cursorHeight,
    this.hintStyle,
    this.color,
    this.colorborder,
    this.border, this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = border ?? buildBorder();

    return TextFormField(
      
      minLines: maxLines,
      controller: controller,
      obscureText: obscureText ?? false,
      onChanged: onSaved,
      keyboardType: keyboardType,
      validator: validator,
      cursorHeight: cursorHeight,
      maxLines: obscureText == true ? 1 : maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefix:prefix,
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
        suffixIconColor: const Color(0xFFC9CECF),
        hintText: hintText,
        filled: true,
        fillColor: color ?? Colors.white,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide:
          BorderSide(width: 1.5, color: colorborder ?? const Color(0xFFC9CECF)),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
