
import 'package:cours_plannig/screens/student/Accueil.screen.dart';
import 'package:cours_plannig/screens/student/cours.screen.dart';
import 'package:cours_plannig/screens/student/profile_sceen.dart';
import 'package:cours_plannig/screens/student/session_screen.dart';
import 'package:cours_plannig/services/cours_service.dart';
import 'package:cours_plannig/services/session.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user.provider.dart';
import '../../widgets/app_bar_navigation.dart';
import '../../widgets/app_config.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  final List<Widget> pages = [ Accueil(), Cour(), Session(), Profile()];

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final userData = userProvider.userData;
    final  userName = userProvider.userData?.name ;
     // print('home  $userName');
    return Scaffold(
     //backgroundColor: Colors.blue
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  const Color(0xFFFFFFFF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

             Text(
              'Bienvenue, $userName',
              style: const TextStyle(
                color: Color(0xFF141414),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.notifications,color: Color(0xFF1e54dd)),
              onPressed: () {

              },
            ),
          ],
        ),
        elevation: 0,
      ),


      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),


   bottomNavigationBar: AppBarNavigation(
       currentIndex: _currentIndex,
       onTabTapped: _onTabTapped,
       items: bottomNavigationBarItems,

     ),







    );

  }


}



