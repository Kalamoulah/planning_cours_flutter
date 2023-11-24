import 'package:cours_plannig/screens/student/homePage.screen.dart';
import 'package:cours_plannig/screens/student/profile_sceen.dart';
import 'package:cours_plannig/screens/student/cours.screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../widgets/app_bar_navigation.dart';
import '../../widgets/app_config.dart';
import '../../widgets/card.dart';

class Session extends StatefulWidget {
  Session({Key? key}) : super(key: key);

  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<Session> {


  CalendarView _calendarView = CalendarView.month;
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20.0),
          child: const Text('All Session',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        calendarViewButton (),
        calendarVIew()
      ],
    );
  }

  Widget calendarVIew(){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7  ,
      child: FractionallySizedBox(
        heightFactor: 1.0,
        child: Container(

          child: SfCalendar(
            key: UniqueKey(),
            view: _calendarView,
          ),
        ),
      ),
    );

  }

  Widget calendarViewButton ()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            print("Changing to Day view");
            setState(() {
              _calendarView = CalendarView.day;
            });
          },
          child: Text('Day'),
        ),
        ElevatedButton(
          onPressed: () {
             setState(() {
              _calendarView = CalendarView.week;
            });
          },
          child: Text('Week'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _calendarView = CalendarView.month;
            });
          },
          child: Text('Month'),
        ),
      ],
    );
  }

}
