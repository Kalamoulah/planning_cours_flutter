  import 'package:cours_plannig/screens/student/cours.screen.dart';
import 'package:cours_plannig/screens/student/homePage.screen.dart';
  import 'package:flutter/foundation.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_svg/svg.dart';

  import '../../models/auth_model.dart';
  import '../../services/auth.service.dart';

  class Login extends StatefulWidget {
    Login({Key? key}) : super(key: key);

    @override
    _LoginState createState() => _LoginState();
  }

  class _LoginState extends State<Login> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    final AuthService authService = AuthService();

    _connexion() async {
      final authData = AuthModel(
        telephone: _usernameController.text,
        password: _passwordController.text,
      );
      final authResponse = await authService.signIn(authData, context);
      return authResponse != null;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const Text(
                      'WELCOME BACK',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'lib/assets/svg/login.svg',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Numero de téléphone',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Mot de passe',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF1e54dd),
                        padding: const EdgeInsets.only(
                            left: 100, right: 100, bottom: 16, top: 16),
                      ),
                      onPressed: () async {
                        final success =   await _connexion();
                        if (success) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                          const  SnackBar(
                              content: Text('Identifiant incorrect'),
                            ),
                          );
                        }
                      },
                      child: const Text('Se Connecter', style: TextStyle(
                        fontSize: 20.0,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
