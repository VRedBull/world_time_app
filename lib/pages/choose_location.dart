import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //The appbar will automatically create an icon to go back to the home screen
        backgroundColor: Colors.teal,
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: FlatButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(Icons.launch_rounded),
          label: Text('Loading')),
    );
  }
}
