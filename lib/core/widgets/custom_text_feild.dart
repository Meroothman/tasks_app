import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/utils/constants.dart';
import '../theme/theme_provider.dart';

class CustomTextFelid extends StatelessWidget {
  CustomTextFelid({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.onChanged,
    this.keyboardType,
    this.suffixOnPressed,
    this.radius = AppConstants.textFieldRadius,
    this.borderSide = BorderSide.none,
    this.contentPadding,
    this.minLines,
    this.maxLines,
  });

  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? suffixOnPressed;
  final double radius;
  final BorderSide borderSide;
  final EdgeInsetsGeometry? contentPadding;
  final int? minLines;
  final int? maxLines;

  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return ValueListenableBuilder(
      valueListenable: _isVisible,
      builder: (context, visible, child) {
        return TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$hintText ${AppConstants.requiredField}';
            }
            return null;
          },
          obscureText: isPassword ? !visible : false,
          style: TextStyle(
              color: themeProvider.textColor, 
              fontSize: AppConstants.buttonFontSize),
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: isPassword ? 1 : maxLines,
          decoration: InputDecoration(
            contentPadding: contentPadding ?? AppConstants.textFieldPadding,
            fillColor: themeProvider.surfaceColor,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: themeProvider.textSecondaryColor),
            prefixIcon: prefixIcon != null 
                ? Icon(prefixIcon, color: themeProvider.textSecondaryColor) 
                : null,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      visible ? Icons.visibility : Icons.visibility_off,
                      color: themeProvider.textSecondaryColor,
                    ),
                    onPressed: () {
                      _isVisible.value = !visible;
                    },
                  )
                : suffixIcon != null
                    ? IconButton(
                        icon: Icon(suffixIcon, 
                            color: themeProvider.textSecondaryColor), 
                        onPressed: suffixOnPressed)
                    : null,
            border: OutlineInputBorder(
              borderSide: borderSide.color == Colors.transparent
                  ? BorderSide(color: themeProvider.borderColor)
                  : borderSide,
              borderRadius: BorderRadius.circular(radius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: borderSide.color == Colors.transparent
                  ? BorderSide(color: themeProvider.borderColor)
                  : borderSide,
              borderRadius: BorderRadius.circular(radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        );
      },
    );
  }
}