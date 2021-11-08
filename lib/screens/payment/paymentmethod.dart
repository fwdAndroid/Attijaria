import 'package:attijaria/screens/payment/bankcard.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { OneDay, TwoDay, three }

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  SingingCharacter? _character = SingingCharacter.OneDay;

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
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            trailing: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
          ),
          child: ListView(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      '1- Your order',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
                Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: ListTile(
                        leading: Image.asset('asset/calender.png'),
                        title: Text('premium ad'),
                        subtitle: Text(
                          '7d days',
                          style: TextStyle(fontSize: 11),
                        ),
                        trailing: Text(
                          '287 DH',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 1,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text('Apply on the anniversary'),
                    ),
                    Container(
                      height: 80,
                      margin: EdgeInsets.only(left: 30, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          'asset/comp.png',
                        ),
                        title: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Macbook',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 10,
                                      ),
                                      Text('Lahore',
                                          style: TextStyle(fontSize: 12)),
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
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '700.90 DH',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
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
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    leading: Text(
                      '2-method of payment',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                  margin: EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  child: Text(
                    'please choose your payment method',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                    leading: Image.asset('asset/card.png'),
                    title: Text('Bank card'),
                    trailing: Radio<SingingCharacter>(
                      value: SingingCharacter.OneDay,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                    leading: Image.asset('asset/cash.png'),
                    title: Text('Cash in branch'),
                    trailing: Radio<SingingCharacter>(
                      value: SingingCharacter.TwoDay,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                    leading: Image.asset('asset/sms.png'),
                    title: Text('SMS'),
                    trailing: Radio<SingingCharacter>(
                      value: SingingCharacter.three,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
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
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => Bankcard()));
                        },
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
              ]),
            ],
          ),
        ));
  }
}
