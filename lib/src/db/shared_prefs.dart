import 'package:shared_preferences/shared_preferences.dart';

/// [SharedPrefs] is used to get the instance of [SharedPreferences]
/// use [instance] getter to get the instance of [SharedPreferences]
class SharedPrefs {
  static SharedPreferences? _prefs;

  /// returns the instance of [SharedPreferences] if it is not null
  /// and if it is null then it will create a new instance of [SharedPreferences]
  static Future<SharedPreferences> get instance async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }
}
