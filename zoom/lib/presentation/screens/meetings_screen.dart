import 'package:flutter/material.dart';
import 'package:zoom/utils/constants/app_colors.dart';

class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet & Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _MeetingButton(
              title: 'New Call',
              icon: Icons.video_call,
              onPressed: () {},
            ),
            _MeetingButton(
              title: 'Join Meeting',
              icon: Icons.add,
              onPressed: () {},
            ),
            _MeetingButton(
              title: 'Share Screen',
              icon: Icons.mobile_screen_share,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class _MeetingButton extends StatelessWidget {
  const _MeetingButton({
    required this.onPressed,
    required this.icon,
    required this.title,
  });

  final String title;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed.call();
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: appAccentColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(
              child: Icon(icon),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
