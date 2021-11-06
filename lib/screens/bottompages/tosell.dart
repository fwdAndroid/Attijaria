import 'package:attijaria/screens/chats/chatlist.dart';
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
      backgroundColor: Colors.black,
      body: ListView(children: [
        Container(
          height: 405,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
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
                margin: EdgeInsets.symmetric(horizontal: 50),
                width: 320,
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Search .....',
                    suffixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  'Connected',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_, i) => Stack(
                    children: <Widget>[
                      Image.asset('asset/shape.png'),
                      Positioned(
                          top: 20,
                          left: 90,
                          child: Image.asset('asset/green.png')),
                      Positioned(
                        bottom: 80,
                        left: 35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Fawad',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (_, i) => InkWell(
                  focusColor: Colors.grey,
                  hoverColor: Colors.grey,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (xtx) => ChatList()));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('asset/profilepic.png'),
                    ),
                    title: Text(
                      'Fawad',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'Hi How Are You',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Text('Monday'),
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}
