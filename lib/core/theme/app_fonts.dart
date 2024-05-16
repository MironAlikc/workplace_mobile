import 'package:flutter/material.dart';
import 'package:workplace_mobile/core/theme/app_colors.dart';

abstract class AppFonts {
  static const TextStyle s16w400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.white,
  );
  static const TextStyle s20w400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: AppColors.blue,
  );
  static const TextStyle s32w400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    color: AppColors.white,
  );
  static const TextStyle s12w500 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.white,
  );
}
