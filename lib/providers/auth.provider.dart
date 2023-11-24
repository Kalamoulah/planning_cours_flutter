import 'package:flutter/material.dart';

import '../models/jwt_response.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  UserData? _userData;

  UserData? get userData => _userData;

  void login(UserData userData) {
    _isLoggedIn = true;
    _userData = userData;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userData = null;
    notifyListeners();
  }
}
