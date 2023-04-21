// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:zoom/presentation/widgets/custom_button.dart';

import 'package:zoom/utils/constants/app_colors.dart';

class JoinMeetingBottomSheet extends StatefulWidget {
  const JoinMeetingBottomSheet({Key? key}) : super(key: key);

  @override
  State<JoinMeetingBottomSheet> createState() => _JoinMeetingBottomSheetState();
}

class _JoinMeetingBottomSheetState extends State<JoinMeetingBottomSheet> {
  final TextEditingController _meetingNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool isMicrophoneOn = false;
  bool isVideoOn = false;
  bool isAvailabledToJoin = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Text(
            'Joining to the meeting',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            maxLength: 8,
            cursorColor: appAccentColor,
            controller: _meetingNumberController,
            decoration: const InputDecoration(
              floatingLabelStyle: TextStyle(color: appAccentColor),
              labelText: 'Enter meeting number (8 numbers)',
            ),
            onChanged: (v) {
              if (v.length == 8) {
                setState(() {
                  isAvailabledToJoin = true;
                });
              } else {
                setState(() {
                  isAvailabledToJoin = false;
                });
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            maxLength: 24,
            cursorColor: appAccentColor,
            controller: _nameController,
            decoration: const InputDecoration(
              floatingLabelStyle: TextStyle(color: appAccentColor),
              labelText: 'Enter your name',
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _MeetingOptionButton(
                isOn: isVideoOn,
                onPressed: () {
                  setState(() {
                    isVideoOn = !isVideoOn;
                  });
                },
                icon: isVideoOn ? Icons.videocam_outlined : Icons.videocam_off_outlined,
                title: isVideoOn ? 'Turned on' : 'Turned off'),
            _MeetingOptionButton(
              isOn: isMicrophoneOn,
              onPressed: () {
                setState(() {
                  isMicrophoneOn = !isMicrophoneOn;
                });
              },
              icon: isMicrophoneOn ? Icons.mic : Icons.mic_off,
              title: isMicrophoneOn ? 'Unmuteed' : 'Muted',
            )
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(title: 'Join meeting', isActive: isAvailabledToJoin, onPressed: () {})
      ],
    );
  }
}

class _MeetingOptionButton extends StatelessWidget {
  const _MeetingOptionButton({
    Key? key,
    required this.isOn,
    required this.onPressed,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final bool isOn;
  final Function onPressed;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isOn ? 4 : 0,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: () {
          onPressed.call();
        },
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: isOn ? appAccentColor : secondaryAlternativeBackgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          constraints: const BoxConstraints(minWidth: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon), Text(title)],
          ),
        ),
      ),
    );
  }
}
