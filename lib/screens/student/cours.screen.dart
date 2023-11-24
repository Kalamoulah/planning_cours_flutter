
import 'dart:convert';

import 'package:cours_plannig/screens/student/profile_sceen.dart';
import 'package:cours_plannig/screens/student/session_screen.dart';
import 'package:cours_plannig/services/cours_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart'; // Importez le package provider
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/user.provider.dart';
import '../../widgets/app_bar_navigation.dart';
import '../../widgets/app_config.dart';
import '../../widgets/card.dart';
import 'homePage.screen.dart';


class Cour extends StatefulWidget {
  const Cour({Key? key}) : super(key: key);

  @override
  CourState createState() => CourState();
}

class CourState extends State<Cour> {
  Map<String, String> moduleImages = {
    "javascript": "javascript.svg",
    "angular": "angular.svg",
  };
  List<dynamic> courData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final userProvider = context.read<UserProvider>();
    final userId = userProvider.userData?.id;
    if (userId != null) {
      final CourService courService = CourService();
      final response = await courService.getCour(userId);
      //print('cour :  $response');
      setState(() {
        courData = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courData.length,
      itemBuilder: (context, index) {
       // return allCourses(courData[index]);
        return allCourses(courData[index]);
      },
    );
  }

  Widget allCourses(dynamic course){
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
         children: [
           Container(
             child: Row(
              children: [
                CardComponent( width: 372.0, height: 200.0,color: Colors.white ,customWidget: viewArea(course)),
                //CardComponent( width: 175.0, height: 200.0,customWidget: const Text('Mon widget personnalisé'),),
              ],
             ),
           )
         ],
      ),
    );
  }

  Widget viewArea(dynamic course) {
    final moduleName = course['module']['module'];
    final moduleImage = moduleImages[moduleName];
   // print('image $moduleName');
    return  Container(
      child:  Row(
        children: [
          Container(
            child:  showImage(moduleImage)
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20, ),
                ligne(course['module']['module'], Icons.library_books),
                const SizedBox(height: 20,),
                ligne( course['professeur']['name'],Icons.person),
                const SizedBox(height: 20,),
                ligne( course['heure_global']+'h', Icons.watch_later),
                const SizedBox(height: 20,),
                ligne( course['semestre'],Icons.work_history)
              ],
            ),
          )
        ],
      )
    );
  }

  Widget ligne( String value, IconData icon) {

    return Container(
        child:  Row(
          children: [
            Icon(icon ,size: 20, color: Colors.blue.withOpacity(0.8),) ,
            const SizedBox(width: 3,),
           /* Text('$item :',
              style: TextStyle(
               color: Colors.blue
            ),
            ),*/
            const SizedBox(width: 4,),
            Text('$value',)
          ],
        )
    );
  }

  Widget showImage(image) {
    return Container(
      height:  150.0,
      width: 150.0 ,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: image != null
          ? SvgPicture.asset('lib/assets/svg/$image')
          : Image.asset('lib/assets/image/defaultImage.jpg')
    );


  }


}




