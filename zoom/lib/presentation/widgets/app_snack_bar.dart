import 'package:flutter/material.dart';
import 'package:zoom/utils/constants/app_colors.dart';
import 'package:zoom/utils/constants/enums.dart';

showSnackBar(BuildContext context, String text, MessageType messageType) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  switch (messageType) {
    case MessageType.info:
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: appAccentColor,
      ));
    case MessageType.error:
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: errorAccentColor,
      ));

    case MessageType.successfulOperation:
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: positiveAccentColor,
      ));
  }
}
