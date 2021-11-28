import 'package:attijaria/screens/payment/paymentmethod.dart';
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
          title: Text('Sell ​​faster'),
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => PaymentMethod()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(343, 61),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: Color(0xffF8B800)),
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 30),
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
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
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
                          padding: EdgeInsets.only(left: 20, top: 4),
                          child: Text(
                            'Your add will be placed at the top of the list\nautomatically every day for the better visibilty ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 14),
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8)),
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
                              borderRadius: BorderRadius.circular(8)),
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
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 157 DH',
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
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 20),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 409 DH',
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
                      ],
                    ),
                  ),
                ),
              ),
              //Second
              Flexible(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: ListTile(
                              leading: Image.asset('asset/sets.png'),
                              title: Text(
                                '6 time more views',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                'RENEWNT + ANNOCE STAR',
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
                          padding: EdgeInsets.only(left: 20, top: 4),
                          child: Text(
                            'Your add will be placed at the top of the list\nautomatically every day for the better visibilty ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 14),
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Text('183 DH'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('7 Day'),
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
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 92  DH',
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
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 15),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 389 DH',
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
                      ],
                    ),
                  ),
                ),
              ),
              //Third
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          padding: EdgeInsets.only(left: 20, top: 4, right: 20),
                          child: Text(
                            'Display your ad in the Premium section, an exclusive and privileged location in large format at the top of the list of ads ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.justify,
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
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '287',
                                    style: TextStyle(
                                      color: Color(0xffF8B800),
                                    ),
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
                          margin: EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save 92 DH',
                                    style: TextStyle(
                                      color: Color(0xffF8B800),
                                    ),
                                  ),
                                  Text(
                                    '429 DH',
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
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
