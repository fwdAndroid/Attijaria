import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
        ),
        body: ListView(children: [
          Container(
            height: MediaQuery.of(context).size.height,
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
                          backgroundImage: AssetImage('assets/images/logo.png'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Rechercher...',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Container(
                                height: 57,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      topLeft: Radius.circular(15)),
                                  color: HexColor("#9098B1"),
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: HexColor('#F8B800'),
                      child: Icon(Icons.add, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            SizedBox(height: 20),
                            Container(
                              height: 175,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset('assets/icons/online.png')),
                            Positioned(
                                bottom: 50,
                                left: 5,
                                child: Text(
                                  'November',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 175,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset('assets/icons/online.png')),
                            Positioned(
                                bottom: 50,
                                left: 5,
                                child: Text(
                                  'November',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 175,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset('assets/icons/online.png')),
                            Positioned(
                                bottom: 50,
                                left: 5,
                                child: Text(
                                  'November',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 175,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset('assets/icons/online.png')),
                            Positioned(
                                bottom: 50,
                                left: 5,
                                child: Text(
                                  'November',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 175,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset('assets/icons/online.png')),
                            Positioned(
                                bottom: 50,
                                left: 5,
                                child: Text(
                                  'November',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 175,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset('assets/icons/online.png')),
                            Positioned(
                                bottom: 50,
                                left: 5,
                                child: Text(
                                  'November',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 175,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset('assets/icons/online.png')),
                            Positioned(
                                bottom: 50,
                                left: 5,
                                child: Text(
                                  'November',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    child: Image.asset('assets/images/dots.png'),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                        itemCount: 2,
                        itemBuilder: (_, i) => InkWell(
                          focusColor: Colors.grey,
                          hoverColor: Colors.grey,
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (xtx) => Favoris()));
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/logo.png'),
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
              ],
            ),
          )
        ]));
  }
}
