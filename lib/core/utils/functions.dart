import 'package:flutter/material.dart';

void pushNavigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
void popNavigateTo(BuildContext context) {
  Navigator.pop(context);
}

void pushReplaceNavigateTo(BuildContext context, Widget page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
void showMassage(BuildContext context, String message, {Color backgroundColor = Colors.black}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ),
  );
}
