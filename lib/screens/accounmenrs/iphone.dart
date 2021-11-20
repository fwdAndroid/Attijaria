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
                      child: Row(children: [
                        Stack(
                          children: [
                            Container(
                              width: 155,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    // width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image:
                                            AssetImage("asset/rectangles.png"),
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
                                  Positioned(
                                    top: 100,
                                    child: Card(
                                      
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              '40.90 DH ',
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
                                                      color:
                                                          HexColor('#9098B1')),
                                                  Text('Casablanca',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: HexColor(
                                                              '#9098B1')))
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.lock_clock,
                                                      size: 10,
                                                      color:
                                                          HexColor('#9098B1')),
                                                  Text(
                                                    '14:17',
                                                    style: TextStyle(
                                                        color:
                                                            HexColor('#9098B1'),
                                                        fontSize: 12),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, top: 5),
                                            child: Text('Les plantes',
                                                style: TextStyle(
                                                    color: HexColor('#9098B1'),
                                                    fontSize: 12)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    )
                  ]),
                ]),
              ),
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.2,
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
