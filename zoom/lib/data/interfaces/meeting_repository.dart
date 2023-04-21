import 'package:zoom/domain/models/app_user.dart';

abstract class MeetingRepository {
  void createNewMeeting({required String roomName, required AppUser user, bool isAudioMuted = true, bool isVideoMuted = true});
  void joinMeeting({required String roomName, required String userName, bool isAudioMuted = true, bool isVideoMuted = true});
}
