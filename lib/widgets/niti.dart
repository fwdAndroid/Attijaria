import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Notipage extends StatefulWidget {
  const Notipage({Key? key}) : super(key: key);

  @override
  _NotipageState createState() => _NotipageState();
}

class _NotipageState extends State<Notipage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: ListTile(
            title: Center(
              child: Text(
                'Attijjara',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                //           Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Voiluter()),
                // );
              },
              child: Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
            ),
            trailing: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        body: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                ),
              ),
            ),
            // Container(
            //   color: Colors.white,
            //   height: 10,

            SizedBox(
              height: 680,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.blue[50],
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Text(
                            '1- Your order',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:
                            230, //Change With MediaQuery.of(context).height *1
                        width: 355,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(color: Colors.green, spreadRadius: 3),
                          // ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,//Add This Line
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: ListTile(
                                leading: Image.asset('assets/iconitem.png'),
                                title: Text('premium ad'),
                                subtitle: Text(
                                  '7d days',
                                  style: TextStyle(fontSize: 11),
                                ),
                                trailing: Text(
                                  '287 DH',
                                  style: TextStyle(color: Colors.black26),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0,
                              thickness: 1,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text('Apply on the anniversary'),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              height: 80,
                              child: ListTile(
                                leading: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Image.asset(
                                    'assets/cameraimage.jpeg',
                                  ),
                                ),
                                title: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Macbook',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                size: 10,
                                              ),
                                              Text('Casablance',
                                                  style:
                                                      TextStyle(fontSize: 9)),
                                              Container(
                                                height: 1,
                                                margin: EdgeInsets.only(
                                                    left: 20, bottom: 10),
                                                child: Icon(
                                                  Icons.timer,
                                                  size: 10,
                                                ),
                                              ),
                                              Text(
                                                '14:15',
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '700.90 DH',
                                          style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                trailing: Column(
                                  children: [
                                    Icon(Icons.more_vert_rounded),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Icon(
                                      Icons.favorite_outline,
                                      size: 13,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          leading: Text(
                            '2-method of payment',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          title: Container(
                              height: 30,
                              width: 50,
                              margin: EdgeInsets.only(left: 20, top: 13),
                              child: Text('secured')),
                          trailing: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Icon(Icons.check_box)),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            'please choose your payment method',
                            style: TextStyle(color: Colors.amber),
                          )),
                      SizedBox(
                        height: 50,
                        child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'please choose your payment method',
                              style: TextStyle(color: Colors.amber),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ]));
  }
}
