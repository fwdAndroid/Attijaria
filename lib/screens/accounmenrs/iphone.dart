import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Iphone extends StatefulWidget {
  const Iphone({Key? key}) : super(key: key);

  @override
  _IphoneState createState() => _IphoneState();
}

class _IphoneState extends State<Iphone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Actuators'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKoW3RiWLPs3pC2N3laOrQeep0S-Pe8O60KWyEXHDSkUWIjY99kaSnxeSJ3NZ3bMk9Ovc&usqp=CAU',
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height,
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '      I Phone',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '     210,000 DH',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.amber),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.place),
                                    Text('Casablanca')
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.lock_clock),
                                    Text('14:17')
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: new EdgeInsetsDirectional.only(
                          start: 20.0, end: 20.0),
                      height: 2.0,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Type: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Phone , Sale',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Sector: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Oulfa',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Brand: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'IPhone',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Model: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'IPhone',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: new EdgeInsetsDirectional.only(
                          start: 20.0, end: 20.0),
                      height: 2.0,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Description',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          Text(
                            'Lorem ipsurm dolor sit amt ,consecturer adipiscing elit .sed quis  fdfsdgsgsg sfsfsf fsfsfsfs fs fs fsf',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: new EdgeInsetsDirectional.only(
                          start: 20.0, end: 20.0),
                      height: 2.0,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Seller',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              radius: 40,
                              child: Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              'Nabeel',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Text('ashar32'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: new EdgeInsetsDirectional.only(
                          start: 20.0, end: 20.0),
                      height: 2.0,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'You Might also like',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    // width: 100,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/phonebg.png"),
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '40.90 DH',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.place,
                                              size: 10,
                                              color: HexColor('#9098B1')),
                                          Text('Casablanca',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: HexColor('#9098B1')))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.lock_clock,
                                              size: 10,
                                              color: HexColor('#9098B1')),
                                          Text('14:17',
                                              style: TextStyle(
                                                  color: HexColor('#9098B1'),
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, top: 5),
                                    child: Text('Les plantes',
                                        style: TextStyle(
                                            color: HexColor('#9098B1'),
                                            fontSize: 12)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    // width: 100,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/phonebg.png"),
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '40.90 DH',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.place,
                                              size: 10,
                                              color: HexColor('#9098B1')),
                                          Text('Casablanca',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: HexColor('#9098B1')))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.lock_clock,
                                              size: 10,
                                              color: HexColor('#9098B1')),
                                          Text('14:17',
                                              style: TextStyle(
                                                  color: HexColor('#9098B1'),
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, top: 5),
                                    child: Text('Les plantes',
                                        style: TextStyle(
                                            color: HexColor('#9098B1'),
                                            fontSize: 12)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    // width: 100,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/phonebg.png"),
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '40.90 DH',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.place,
                                              size: 10,
                                              color: HexColor('#9098B1')),
                                          Text('Casablanca',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: HexColor('#9098B1')))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.lock_clock,
                                              size: 10,
                                              color: HexColor('#9098B1')),
                                          Text('14:17',
                                              style: TextStyle(
                                                  color: HexColor('#9098B1'),
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, top: 5),
                                    child: Text('Les plantes',
                                        style: TextStyle(
                                            color: HexColor('#9098B1'),
                                            fontSize: 12)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    // width: 100,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/phonebg.png"),
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '40.90 DH',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.place,
                                              size: 10,
                                              color: HexColor('#9098B1')),
                                          Text('Casablanca',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: HexColor('#9098B1')))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.lock_clock,
                                              size: 10,
                                              color: HexColor('#9098B1')),
                                          Text('14:17',
                                              style: TextStyle(
                                                  color: HexColor('#9098B1'),
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, top: 5),
                                    child: Text('Les plantes',
                                        style: TextStyle(
                                            color: HexColor('#9098B1'),
                                            fontSize: 12)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ])
                ])),
            Positioned(
                top: 230,
                left: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.amberAccent,
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amberAccent,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          )),
                      onPressed: () {},
                      child: Text('Chat with the seller'),
                    )
                  ],
                )),
          ])
        ])));
  }
}
