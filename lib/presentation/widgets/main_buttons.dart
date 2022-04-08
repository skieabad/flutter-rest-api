import 'package:flutter/material.dart';

Widget mainButtons(
    Function()? onPressed, String buttonText, Color colorButton) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: SizedBox(
      height: 50,
      width: 230,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(primary: colorButton),
      ),
    ),
  );
}
