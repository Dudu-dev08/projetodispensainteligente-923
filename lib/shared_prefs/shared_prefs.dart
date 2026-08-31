import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _userKey = 'USER';

  Future<void> setUserStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_userKey, value);
  }

  Future<bool> getUserStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool(_userKey);
    return status ?? false;
  }
}
