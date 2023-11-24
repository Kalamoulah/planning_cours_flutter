import 'package:cours_plannig/screens/student/homePage.screen.dart';
import 'package:cours_plannig/screens/student/session_screen.dart';
import 'package:cours_plannig/screens/student/cours.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user.provider.dart';
import '../../services/cours_service.dart';
import '../../services/session.service.dart';
import '../../widgets/app_bar_navigation.dart';
import '../../widgets/app_config.dart';
import '../../widgets/card.dart';


class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<Accueil> {
  List<dynamic> sessionOfTheDayData = [];
  List<dynamic> courData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchSessionOfTheDayData();
  }

  Future<void> fetchSessionOfTheDayData() async {
    final userProvider = context.read<UserProvider>();
    final userId = userProvider.userData?.id;
    if (userId != null) {
      final SessionService courService = SessionService();
      final response = await courService.getSessionOfTheDay(userId);
      //print('Session of the day  :  $response');
      setState(() {
        sessionOfTheDayData = response;
      });
      print('Session of the day  :  $sessionOfTheDayData');
    }
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
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20.0),
          child: const Text('Sessions du jour',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        todaySession(),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: const Text('Mes cours',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        courView(),
      ],
    );
  }


 /* Widget todaySession() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardComponent( width: 300.0, height: 200.0, customWidget: const Text('Mon sesion1'),),
          CardComponent( width: 300.0, height: 200.0,),
          CardComponent( width: 300.0, height: 200.0,),
          CardComponent( width: 300.0, height: 200.0,),
        ],
      ),
    );
   }*/

 Widget todaySession() {
   final currentTime = DateTime.now();
   return Container(
     height: 210.0,
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: sessionOfTheDayData.length,
       itemBuilder: (BuildContext context, int index) {
         final sessionData = sessionOfTheDayData[index];
         final sessionStartTime = DateTime.parse(sessionData['date'] + ' ' + sessionData['heure_debut']);
         final sessionEndTime = DateTime.parse(sessionData['date'] + ' ' + sessionData['heure_fin']);
         final isSessionNotStarted = currentTime.isBefore(sessionStartTime);

         return CardComponent(
           width: 300.0,
           height: 200.0,
           customWidget: viewArea(sessionData,isSessionNotStarted),
         );
       },
     ),
   );
  }

   Widget courView() {
     return  SingleChildScrollView(
       scrollDirection: Axis.vertical,
       child: Column (
         children: [
           CardComponent( width: 370.0, height: 100.0, color: Colors.white, customWidget: view('javascript')),
           CardComponent( width: 370.0, height: 100.0, color: Colors.white,customWidget: view('angular')),
           CardComponent( width: 370.0, height: 100.0, color: Colors.white, customWidget: view('javascript')),
           CardComponent( width: 370.0, height: 100.0, color: Colors.white, customWidget: view('laravel')),
           CardComponent( width: 370.0, height: 100.0, color: Colors.white, customWidget: view('laravel')),
         ],
       ),
     );
   }


  Widget view(String nom) {

    return  Container(

      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( nom ,style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, color: Colors.blue
          )),

        ],
      ),

    );
  }




  Widget viewArea(dynamic session, bool isSessionNotStarted) {

    return  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(session['classe_cours_id']['cours']['module']['module'], style: const TextStyle(
                fontSize: 42, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, color: Colors.white
            )
            ),
            const SizedBox(height: 7,),
            Text(session['classe_cours_id']['cours']['professeur']['name'], style:  TextStyle(
                fontSize: 24, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal,
                color: Colors.white.withOpacity(0.9)
            )),
            const SizedBox(height: 10,),
            Text(session['heure_debut'] +' - ' + session['heure_fin'],
                style:  TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal,
                    color: Colors.white.withOpacity(0.9)
                )
            ),
            const SizedBox(height: 5,),

            Container(

              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFFFFFF),
                    side: BorderSide(width: 1, color: Colors.blue),
                  ),
                  onPressed: isSessionNotStarted ? null : () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const  SnackBar(
                        content: Text('Emergement reussie'),
                        ),
                        );

                  },
                  child: const Text('participer', style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  )
                  ),
                ),
              ),
            ),

          ],
        )
    );
  }

}

