import 'dart:ui';

import 'package:flutter/material.dart';

enum SingingCharacter {
  OneDay,
  TwoDays,
  Threeday,
  FourthennDay,
  SevenDay,
  ThirteenDay
}

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  SingingCharacter? _character = SingingCharacter.OneDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 15,
          ),
          title: Text(
            'Sell faster',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          // automaticallyImplyLeading: false,
        ),
        body: ListView(children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: 100,
              child: Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            'Chose your pack',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 20, top: 4),
                            child: Text(
                              'Please choose a packe and a duration bellow',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16,
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: ListTile(
                              leading: Image.asset('asset/rocket.png'),
                              title: Text(
                                '9 time more views',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                'RENEWLS',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              trailing: Text(
                                'More information',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 11),
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 30, top: 4),
                            child: Text(
                              'Your add will be placed at the top of the list\nautomatically every day for the better visibilty ',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 14,
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Text('24 DH'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('1 Day'),
                                Radio<SingingCharacter>(
                                  value: SingingCharacter.OneDay,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 61 DH',
                                    style: TextStyle(
                                      color: Color(0xffF8B800),
                                    ),
                                  ),
                                  Text(
                                    '107 DH',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('7 Day'),
                                Radio<SingingCharacter>(
                                  value: SingingCharacter.SevenDay,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 61 DH',
                                    style: TextStyle(
                                      color: Color(0xffF8B800),
                                    ),
                                  ),
                                  Text(
                                    '179 DH',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('14 Day'),
                                Radio<SingingCharacter>(
                                  value: SingingCharacter.FourthennDay,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 61 DH',
                                    style: TextStyle(
                                      color: Color(0xffF8B800),
                                    ),
                                  ),
                                  Text(
                                    '311 DH',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('30 Day'),
                                Radio<SingingCharacter>(
                                  value: SingingCharacter.ThirteenDay,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: ListTile(
                              leading: Image.asset('asset/set.png'),
                              title: Text(
                                '9 time more views',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                'RENEWLS & Automente',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              trailing: Text(
                                'More information',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 11),
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 30, top: 4),
                            child: Text(
                              'Your add will be placed at the top of the list\nautomatically every day for the better visibilty ',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 14,
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 61 DH',
                                    style: TextStyle(
                                      color: Color(0xffF8B800),
                                    ),
                                  ),
                                  Text(
                                    '107 DH',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('7 Day'),
                                Radio<SingingCharacter>(
                                  value: SingingCharacter.SevenDay,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 61 DH',
                                    style: TextStyle(
                                      color: Color(0xffF8B800),
                                    ),
                                  ),
                                  Text(
                                    '274 DH',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('14 Day'),
                                Radio<SingingCharacter>(
                                  value: SingingCharacter.FourthennDay,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 61 DH',
                                    style: TextStyle(
                                      color: Color(0xffF8B800),
                                    ),
                                  ),
                                  Text(
                                    '395 DH',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('30 Day'),
                                Radio<SingingCharacter>(
                                  value: SingingCharacter.ThirteenDay,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: ListTile(
                              leading: Image.asset('asset/color.png'),
                              title: Text(
                                '15 time more views',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                'ANNONCE PREMIUM',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              trailing: Text(
                                'More information',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 11),
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 30, top: 4),
                            child: Text(
                              'Affichez votre annonce in the Premium section, an exclusive and privileged location in grand format at the top of the list of annonces ',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 14,
                              ),
                            )),
                        Container(
                          width: 300,

                          height: 50,

                          margin: EdgeInsets.only(left: 20, top: 20),

                          // padding: EdgeInsets.all(5),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),

                          child: ListTile(
                              leading: Column(
                                children: [
                                  Text(
                                    'Save 61 DH',
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '107 DH',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              trailing: SizedBox(
                                height: 30,
                                width: 70,
                                child: Row(
                                  children: [
                                    Text('1 day',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Radio<SingingCharacter>(
                                        value: SingingCharacter.TwoDays,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        }),
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          width: 300,

                          height: 50,

                          margin: EdgeInsets.only(left: 20, top: 20),

                          // padding: EdgeInsets.all(5),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),

                          child: ListTile(
                              leading: Column(
                                children: [
                                  Text(
                                    'Save 61 DH',
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '107 DH',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              horizontalTitleGap: 16.0,
                              title: Text(''),
                              trailing: SizedBox(
                                height: 30,
                                width: 70,
                                child: Row(
                                  children: [
                                    Text('1 day',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Radio<SingingCharacter>(
                                        value: SingingCharacter.TwoDays,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        }),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            child: const Text('Carry on ssasa'),
                            onPressed: () {
                              //  Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) =>  Booster()),
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 20),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ]))))
        ]));
  }
}
