import 'package:flutter/material.dart';
import 'package:zoom/utils/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: appAccentColor,
      ),
    );
  }
}
