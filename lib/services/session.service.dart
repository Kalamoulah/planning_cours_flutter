import 'dart:convert';
import 'package:http/http.dart' as http;
class SessionService {

  Future<dynamic> getSessionOfTheDay(int userId)async {
    var url = Uri.parse('http://10.0.2.2:8000/api/session/day/student/$userId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final sessionOfTheDayList = responseBody['data'] as List<dynamic>;
    //  print('sessionofTHeDay $sessionOfTheDayList');
      return sessionOfTheDayList;
    } else {
      print('mouusa ');
    }
  }


}