import 'package:flutter/material.dart';

showSnackBar(BuildContext context,
    {required String text, required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    ),
  );
}
