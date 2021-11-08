import 'dart:ui';

import 'package:attijaria/screens/config/config.dart';
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
    final ScrollController _controller = ScrollController();
    void _scrollListener() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        setState(() {
          String message = "reach the bottom";
          print(message);
        });
      }
      if (_controller.offset <= _controller.position.minScrollExtent &&
          !_controller.position.outOfRange) {
        setState(() {
          String message = "reach the top";
          print(message);
        });
      }
    }

    @override
    void initState() {
      _controller.addListener(_scrollListener);

      super.initState();
    }

    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      _controller.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Sell faster',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return ListView(children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 5),
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
                    padding: EdgeInsets.only(top: 10, left: 20),
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
                          style: TextStyle(color: Colors.black38, fontSize: 11),
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
                        borderRadius: BorderRadius.circular(12)),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                          style: TextStyle(color: Colors.black38, fontSize: 11),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                          style: TextStyle(color: Colors.black38, fontSize: 11),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Rounded Button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(300, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              primary: Color(0xffF8B800)),
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ]);
      }),
    );
  }
}
