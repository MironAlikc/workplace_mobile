import 'package:flutter/material.dart';
import 'package:workplace_mobile/core/theme/app_colors.dart';
import 'package:workplace_mobile/core/theme/app_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.lable,
    required this.onPressed,
  });
  final String lable;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            // side: const BorderSide(width: 2, color: Colors.green),
          ),
          backgroundColor: AppColors.white,
        ),
        onPressed: onPressed,
        child: Text(
          lable,
          style: AppFonts.s20w400,
        ),
      ),
    );
  }
}
