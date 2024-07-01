import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  String? getToken() {
    return _sharedPreferences!.getString("token") ?? "";
  }

  saveToken(String token) {
    _sharedPreferences!.setString("token", token);
  }

  String? getID() {
    return _sharedPreferences!.getString("id") ?? "";
  }

  saveId(String id) {
    _sharedPreferences!.setString("id", id);
  }

///////Save Mobile number

  String? getMobile() {
    return _sharedPreferences!.getString("mobile") ?? "";
  }

  saveMobile(String id) {
    _sharedPreferences!.setString("mobile", id);
  }

  ///////Save Referral code
  String? getreferralcode() {
    return _sharedPreferences!.getString("referral") ?? "";
  }

  savereferralcode(String id) {
    _sharedPreferences!.setString("referral", id);
  }

  saveGuetLogin() {
    _sharedPreferences!.setBool("guest-login", true);
  }

  bool? isGuestLogin() {
    return _sharedPreferences!.getBool("guest-login");
  }

  saveNotificationCount() {
    int count = _sharedPreferences!.getInt("notification-count") ?? 0;
    count++;
    _sharedPreferences!.setInt("notification-count", count);
  }

  clearNotificationCount() {
    _sharedPreferences!.setInt("notification-count", 0);
  }

  int getNotificationCount() {
    return _sharedPreferences!.getInt("notification-count") ?? 0;
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences?.clear();
  }
}
