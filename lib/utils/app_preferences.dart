import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  //region AppPref setup
  Future? _isPreferenceInstanceReady;
  late SharedPreferences _preferences;

  static final AppPref _instance = AppPref._internal();

  factory AppPref() => _instance;

  AppPref._internal() {
    _isPreferenceInstanceReady = SharedPreferences.getInstance()
        .then((preferences) => _preferences = preferences);
  }

  Future? get isPreferenceReady => _isPreferenceInstanceReady;

  //endregion setup

  /// to find login status
  bool get isLogin => _preferences.getBool('isLogin') ?? false;
  set isLogin(bool value) => _preferences.setBool('isLogin', value);
  String get token => _preferences.getString('token') ?? "";
  set token(String value) => _preferences.setString('token', value);
String get refreshToken => _preferences.getString('refreshToken') ?? "";
  set refreshToken(String value) => _preferences.setString('refreshToken', value);
  //for user id.....
  String get userId => _preferences.getString('userId') ?? "";
  set userId(String value) => _preferences.setString('userId', value);
  String get partner_id => _preferences.getString('partner_id') ?? "";
  set partner_id(String value) => _preferences.setString('partner_id', value);
  String get clientId => _preferences.getString('clientId') ?? "";
  set clientId(String value) => _preferences.setString('clientId', value);


  /// retrieve app current language
  String get languageCode => _preferences.getString('languageCode') ?? 'en';
  set languageCode(String value) =>
      _preferences.setString('languageCode', value);

  /// retrieve app mode light/dark
  bool get isDark => _preferences.getBool('isDark') ?? false;
  set isDark(bool value) => _preferences.setBool('isDark', value);



  void clear() async {
    _preferences.clear();
  }
}
