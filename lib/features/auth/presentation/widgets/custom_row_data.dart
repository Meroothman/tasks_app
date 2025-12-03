import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';

class RowData extends StatelessWidget {
  const RowData({
    super.key,
    required this.text,
    required this.textButton,
    required this.screenName,
  });

  final String text;
  final String textButton;
  final Widget screenName;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: themeProvider.textSecondaryColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => screenName),
            );
          },
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}