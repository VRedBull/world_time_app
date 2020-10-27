import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //Location name for UI
  String time; //Time in that location
  String flag; //URL to an asset flag icon
  String url; //location URL for api endpoint
  bool isDayTime;

  WorldTime({
    this.location,
    this.flag,
    this.url,
  });

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);
      // print(data);
      //get properties from data
      String dateTime, offset_hour, offset_min;
      dateTime = data['datetime'];
      offset_hour = data['utc_offset'].substring(1, 3);
      offset_min = data['utc_offset'].substring(4, 6);
      // print('$dateTime');
      // print(offset_hour);

      //create a dateTime object

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(
          hours: int.parse(offset_hour), minutes: int.parse(offset_min)));

      isDayTime = now.hour >= 6 && now.hour < 20 ? true : false;

      //Set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not fetch the data';
    }
  }
}
