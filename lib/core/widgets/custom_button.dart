import 'package:flutter/material.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.data,
    required this.onPressed,
    this.width = double.infinity,
    this.color = AppColors.primary,
    this.fontSize = AppConstants.buttonFontSize,
    this.radius = AppConstants.buttonRadius,
  });

  final String data;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final double fontSize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: width,
      height: AppConstants.buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.largePadding,
            vertical: AppConstants.smallPadding,
          ),
        ),
        child: Text(data, style: TextStyle(fontSize: fontSize)),
      ),
    );
  }
}
