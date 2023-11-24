
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:cours_plannig/models/auth_model.dart';
import 'package:http/http.dart' as http;
import '../models/jwt_response.dart';
import '../providers/user.provider.dart';
import 'package:provider/provider.dart';


class AuthService {

  var url = Uri.parse('http://10.0.2.2:8000/api/login');
  Future signIn(AuthModel authData, BuildContext context) async {
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type':'application/json',
          'accept': 'application/json'
        },
        body: jsonEncode(authData.toJson())
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final AuthResponse authResponse = AuthResponse.fromJson(data);

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', authResponse.token);
      final userJson = jsonEncode(authResponse.user.toJson());
      prefs.setString('userAuth', userJson);

      final userProvider = context.read<UserProvider>();
      userProvider.setUser(authResponse.user);
       //print("breukh");
       return authResponse;
    } else {
       print('Échec de la connexion. Code de statut : ${response.statusCode}');
    }
  }
}