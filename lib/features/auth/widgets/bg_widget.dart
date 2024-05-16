import 'package:flutter/material.dart';
import 'package:workplace_mobile/core/theme/app_colors.dart';

class BGWidget extends StatelessWidget {
  const BGWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: AppColors.gradientBGColor,
        ),
      ),
      child: child,
    );
  }
}
