import 'package:bot_flut/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey { loggedIn, id, name, email, token }

class SharedPreferenceController {
  late SharedPreferences _sharedPreferences;

  static final SharedPreferenceController _instance =
      SharedPreferenceController._();

  SharedPreferenceController._();

  factory SharedPreferenceController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKey.email.toString(), user.email!);
    await _sharedPreferences.setString(PrefKey.name.toString(), user.name!);
    await _sharedPreferences.setString(
        PrefKey.token.toString(), 'Bearer ${user.token}');
    await _sharedPreferences.setInt(PrefKey.id.toString(), user.id!);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKey.loggedIn.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKey.token.toString()) ?? '';

  int get id => _sharedPreferences.getInt(PrefKey.id.toString()) ?? 0;
}
