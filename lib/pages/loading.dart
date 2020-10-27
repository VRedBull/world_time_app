import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert'; //Decodes JSON strings
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTIme() async {
    WorldTime instance = WorldTime(
        location: 'Brazil', flag: 'indian.png', url: 'America/Rio_Branco');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTIme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Loading screen'),
        centerTitle: true,
      ),
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.yellow[700],
          size: 50.0,
        ),
      ),
    );
  }
}
