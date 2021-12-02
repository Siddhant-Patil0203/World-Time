import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);
    String bgImage = (data['isDaytime'] ? 'day.jpg' : 'night.jpg');
    Color bgColor = (data['isDaytime'] ? Colors.lightBlueAccent : Colors.indigo.shade900);
    Color _text = data['isDaytime'] ? Colors.black87 : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              OutlinedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDaytime': result['isDaytime'],
                        };
                      });
                    }
                  },
                  icon: Icon(
                      Icons.edit_location,
                      color: _text ,
                  ),
                  label: Text(
                      'Edit Location',
                       style : TextStyle(
                         color: _text,
                       )
                  ),
                ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: _text,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data['time'],
                style: const TextStyle(
                  fontSize: 66,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
