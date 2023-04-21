import 'dart:developer';

import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom/data/data_sources/remote/client_api.dart';
import 'package:zoom/data/interfaces/meeting_repository.dart';
import 'package:zoom/domain/models/app_user.dart';

class MeetingRepositoryImpl implements MeetingRepository {
  final ClientAPI api;

  MeetingRepositoryImpl({required this.api});

  @override
  void createNewMeeting({required String roomName, required AppUser user, bool isAudioMuted = true, bool isVideoMuted = true}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = user.name
        ..userEmail = user.email
        ..userAvatarURL = user.photoUrl
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      log('Error while meeting: $error');
    }
  }

  @override
  void joinMeeting({required String roomName, required String userName, bool isAudioMuted = true, bool isVideoMuted = true}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = userName
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      log('Error while meeting: $error');
    }
  }
}
