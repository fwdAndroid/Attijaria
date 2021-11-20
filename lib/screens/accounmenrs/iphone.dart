import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MotoAnnounce extends StatefulWidget {
  const MotoAnnounce({Key? key}) : super(key: key);

  @override
  _MotoAnnounceState createState() => _MotoAnnounceState();
}

class _MotoAnnounceState extends State<MotoAnnounce> {
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
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('asset/moto.png',
                            height: 200, fit: BoxFit.fitWidth),
                      ),
                    ),
                    Positioned(
                      top: 20,
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
                padding: const EdgeInsets.only(top: 190),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
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
                              '     Moto',
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
                          Row(children: [
                            Image.asset('asset/diseal.png'),
                            SizedBox(width: 10),
                            Text('Diesel'),
                            SizedBox(width: 10),
                            Image.asset('asset/blackkm.png'),
                            SizedBox(width: 10),
                            Text('8CV'),
                            SizedBox(width: 10),
                            Image.asset('asset/blackcalender.png'),
                            SizedBox(width: 10),
                            Text('2021'),
                          ]),
                          SizedBox(height: 10),
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
                          SizedBox(height: 10),
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
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Origine',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                ' WW au Maroc',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Premiére main',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                ' Oui',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          ListTile(
                              title: Text('Afficher plus de détails',
                                  style: TextStyle(color: Colors.amber)),
                              trailing: Icon(Icons.arrow_drop_down_outlined,
                                  color: Colors.amber))
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
                          Container(
                            child: Text(
                              'Lorem ipsurm dolor sit amt ,consecturer adipiscing elit .sed quis  fdfsdgsgsg sfsfsf fsfsfsfs fs fs fsf',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: new EdgeInsetsDirectional.only(
                                start: 20.0, end: 20.0),
                            height: 2.0,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('Equipements',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('asset/mask.png'),
                                    SizedBox(width: 10),
                                    Text('ouvrant',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 30),
                                    Image.asset('asset/mdi_car-seat.png'),
                                    SizedBox(width: 10),
                                    Text('Siéges cuir',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('asset/ic_baseline-radar.png'),
                                    SizedBox(width: 10),
                                    Text('Radar de recul',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 30),
                                    Image.asset('asset/zmdi_camera-add.png'),
                                    SizedBox(width: 10),
                                    Text('Caméra de recul',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
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
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Vendeur',
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
                                'asset/profilepic.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              'Nabeel',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: HexColor('#5D55B4')),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'ashar32',
                                style: TextStyle(color: HexColor('#5D55B4')),
                              ),
                            ),
                          )
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
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor("#F6F7F8"),
                                  )),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Card(
                                          margin: EdgeInsets.only(left: 10),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 200,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.4,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: 200,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                            'https://media.istockphoto.com/photos/colorful-carnival-or-party-frame-of-balloons-streamers-and-confetti-picture-id911842696?b=1&k=20&m=911842696&s=170667a&w=0&h=VXKcc0dRb1xKNQjS_P4A5Tum-OMDU6W8jdo58Dllyks=',
                                                            fit: BoxFit
                                                                .fitHeight),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 10,
                                                      right: 20,
                                                      child: Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '700,90 DH',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_city,
                                                    size: 10,
                                                    color: HexColor('#9098B1'),
                                                  ),
                                                  Text(
                                                    'Casablanca',
                                                    style: TextStyle(
                                                      color:
                                                          HexColor('#9098B1'),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Icon(
                                                    Icons.lock_clock,
                                                    size: 10,
                                                    color: HexColor('#9098B1'),
                                                  ),
                                                  Text(
                                                    '14:17',
                                                    style: TextStyle(
                                                      color:
                                                          HexColor('#9098B1'),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Livre Mac',
                                                style: TextStyle(
                                                  color: HexColor('#9098B1'),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ]),
              ),
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  // top: 170,
                  // left: 100,
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            )),
                        onPressed: () {},
                        child: Text('Chat with the seller'),
                      )
                    ],
                  )),
              Positioned(
                width: MediaQuery.of(context).size.width,
                top: 130,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: 0.0,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              )
            ]),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset('asset/ads.png')),
          ],
        ),
      ),
    );
  }
}
