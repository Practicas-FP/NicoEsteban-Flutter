import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image:
        "https://lh3.googleusercontent.com/a-/AOh14GgC5HZrsUPC_JGP1FD_aLE8Qij5i47O6aXexM-stac=s360-p-rw-no",
    name: 'NicoEsteban',
    email: 'nico.esteban@mail.com',
    phone: 'Málaga, Spain',
    aboutMeDescription:
        '...',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
