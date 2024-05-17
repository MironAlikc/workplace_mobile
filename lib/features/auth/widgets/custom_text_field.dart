import 'package:flutter/material.dart';
import 'package:workplace_mobile/core/theme/app_colors.dart';
import 'package:workplace_mobile/core/theme/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.icon,
    required this.onChanged,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    required this.onIconPress,
    this.errorText,
  });
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Function(String) onChanged;
  final bool isPassword;
  final Function() onIconPress;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscuringCharacter: '*',
      obscureText: isPassword,
      onChanged: onChanged,
      style: AppFonts.s16w400,
      controller: controller,
      decoration: InputDecoration(
        errorText: errorText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
        ),
        hintText: hintText,
        //  helperText: lable,
        hintStyle: AppFonts.s16w400.copyWith(
          color: AppColors.white,
        ),
        suffixIcon: IconButton(
          color: Colors.blue,
          onPressed: onIconPress,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
