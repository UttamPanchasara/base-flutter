import 'dart:convert';

import 'package:flutter_base/ui/profile/data/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final SessionManager _converter = SessionManager._internal();

  static String prefKey = "PREF_USER";

  factory SessionManager() {
    return _converter;
  }

  SessionManager._internal();

  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  Observable<bool> isUserLoggedIn() {
    return Observable.fromFuture(getUserPref())
        .map((user) => true)
        .onErrorReturn(false);
  }

  Observable<User> getUser() {
    return Observable.fromFuture(getUserPref());
  }

  Observable<bool> addUser(User user) {
    return Observable.fromFuture(_sharedPreferences).map((sharedPreferences) {
      String jsonVal = json.encode(user.toJson());
      return sharedPreferences.setString(prefKey, jsonVal);
    }).map((noData) => true);
  }

  /// this will clear all the data from pref.
  Observable<bool> clearSession() {
    return Observable.fromFuture(_sharedPreferences).map((sharedPreferences) {
      return sharedPreferences.clear();
    }).map((noData) => true);
  }

  Observable<bool> updateUser(User user) {
    return addUser(user);
  }

  Future<User> getUserPref() async {
    SharedPreferences sharedPreferences = await _sharedPreferences;
    try {
      String userJson = sharedPreferences.getString(prefKey);
      final user = User.fromJson(json.decode(userJson));
      if (user?.userId == null)
        return Future.error("No user found");
      else
        return Future.value(user);
    } catch (exception) {
      print(exception.toString());
      return Future.error("No user found");
    }
  }
}
