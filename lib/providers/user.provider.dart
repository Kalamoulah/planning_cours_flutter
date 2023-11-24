import 'package:flutter/foundation.dart';

import '../models/jwt_response.dart';

class UserProvider with ChangeNotifier {
  UserData? _user;

  UserData? get userData => _user;

  void setUser(UserData user) {
    _user = user;
    notifyListeners();
  }
}

