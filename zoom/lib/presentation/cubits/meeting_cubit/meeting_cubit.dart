import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom/data/interfaces/meeting_repository.dart';
import 'package:zoom/presentation/cubits/user_cubit/user_cubit.dart';

part 'meeting_state.dart';

class MeetingCubit extends Cubit<MeetingState> {
  // Статические методы для прослушивания и получения кубита
  static MeetingState watchState(BuildContext context) => context.watch<MeetingCubit>().state;
  static MeetingCubit read(BuildContext context) => context.read<MeetingCubit>();

  MeetingCubit({
    required MeetingRepository meetingRepository,
    required UserCubit userCubit,
  })  : _meetingRepository = meetingRepository,
        _userCubit = userCubit,
        super(MeetingState());

  final MeetingRepository _meetingRepository;
  final UserCubit _userCubit;

  void createNewMeeting() {
    final random = Random();
    final roomName = random.nextInt(1000000) + 10000000;
    _meetingRepository.createNewMeeting(
      roomName: roomName.toString(),
      user: _userCubit.state.user,
    );
  }

  void joinMeeting({required String roomNumber, required String name, required bool isMicrophoneOn, required bool isVideoOn}) {
    _meetingRepository.joinMeeting(
      roomName: roomNumber,
      userName: name,
      isAudioMuted: isMicrophoneOn,
      isVideoMuted: isVideoOn,
    );
  }
}
