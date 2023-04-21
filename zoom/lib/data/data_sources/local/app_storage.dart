import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  final SharedPreferences preferences;

  AppStorage({required this.preferences});
  final String _userIDKey = 'userID_key';

  void saveUserID(String id) async {
    await preferences.setString(_userIDKey, id);
  }

  String? fetchUserID() {
    return preferences.getString(_userIDKey);
  }
}
