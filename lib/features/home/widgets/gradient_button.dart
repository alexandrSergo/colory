import 'package:flutter/material.dart';
import 'package:super_cat/components/constants.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, 
    required this.text, 
    required this.onPressed
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: kGradient
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 17),),
      ),
    );
  }
}