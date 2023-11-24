

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/jwt_response.dart';

class CourService {
  Future<UserData?> getDataUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('userAuth');
    if (userJson != null) {
      final userData = UserData.fromJson(jsonDecode(userJson));
      return userData;
    }
    return null;
  }

  Future<dynamic> getCour(int userId)async {
    var url = Uri.parse('http://10.0.2.2:8000/api/cours/student/$userId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final coursList = responseBody['data'] as List<dynamic>;
    //  print(coursList);
          return coursList;
          
    } else {
        print('mouusa ');
    }
  }
}