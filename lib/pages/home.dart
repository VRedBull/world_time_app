import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImg =
        data['isDayTime'] == true ? 'assets/day.jpg' : 'assets/night.jpg';
    Color bgColor =
        data['isDayTime'] == true ? Colors.lightBlueAccent : Colors.indigo;

    Color txtColor =
        data['isDayTime'] == true ? Colors.grey[800] : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('$bgImg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 130, 20, 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 35, letterSpacing: 2, color: txtColor),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: TextStyle(fontSize: 55, color: txtColor),
              ),
              SizedBox(
                height: 70,
              ),
              FlatButton.icon(
                  color: txtColor,
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context,
                        '/location'); //Pushes the location screen over the home page
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.add_location,
                    color: Colors.lightBlue,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.lightBlue),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
