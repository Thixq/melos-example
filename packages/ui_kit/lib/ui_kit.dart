library;

import 'package:flutter/material.dart';

class CustomCounterButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;

  const CustomCounterButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
