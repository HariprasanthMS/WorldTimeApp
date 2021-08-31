import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime {
  String location; // location name
  String time; // time
  String flag; // url to flag icon
  String url; // url to api
  bool isDayTime;
  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response resonse =
          await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(resonse.body);

      String dateTime = data['datetime'];
      String offsetHour = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);

      // create date object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offsetHour)));
      now = now.add(Duration(minutes: int.parse(offsetMin)));

      isDayTime = now.hour > 6 && now.hour < 18 ? true: false;

      time = DateFormat.jm().format(now); // set time property
      
    } catch (e) {
      print('Caught error: $e');
      time = 'Cannot get time currently';
    }
  }
}
