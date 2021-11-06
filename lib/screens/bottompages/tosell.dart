import 'package:flutter/material.dart';

class ToSell extends StatefulWidget {
  const ToSell({Key? key}) : super(key: key);

  @override
  _ToSellState createState() => _ToSellState();
}

class _ToSellState extends State<ToSell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('asset/profilepic.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Fawad Kaleem',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: [TextFormField()],
          ),
        )
      ]),
    );
  }
}
