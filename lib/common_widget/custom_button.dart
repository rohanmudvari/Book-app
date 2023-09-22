import 'package:flutter/material.dart';
import 'package:riverpods/constant/app_colors.dart';




class CustomButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.appMainColor
        ),
        onPressed: onPressed,
        child: Text(label, style: TextStyle(color: Colors.black),)
    );
  }
}