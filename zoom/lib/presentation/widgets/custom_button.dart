import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 44)),
        onPressed: () {
          onPressed.call();
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
