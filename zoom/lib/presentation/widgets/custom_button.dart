import 'package:flutter/material.dart';
import 'package:zoom/utils/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, required this.onPressed, this.isActive = true}) : super(key: key);

  final bool isActive;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 44),
          primary: isActive ? appAccentColor : secondaryAlternativeBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
        ),
        onPressed: () {
          if (isActive) {
            onPressed.call();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
