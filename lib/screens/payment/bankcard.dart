import 'package:flutter/material.dart';

enum SingingCharacter { OneDay, TwoDay }

class Bankcard extends StatefulWidget {
  const Bankcard({Key? key}) : super(key: key);

  @override
  _BankcardState createState() => _BankcardState();
}

class _BankcardState extends State<Bankcard> {
  SingingCharacter? _character = SingingCharacter.OneDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                primary: Color(0xffF8B800)),
            child: Text(
              "Confrim",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Bank card'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        ),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Payment',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          leading: Text(
                            'Name of the card holder',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.yellow, width: 2),
                            ),
                            hintText: 'Nour when',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          leading: Text(
                            'Card Number',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.yellow, width: 2),
                            ),
                            suffixIcon: Image.asset('asset/master.png'),
                            hintText: '1222-2222-121212',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          leading: Text(
                            'Expiry Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: TextField(
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      hintText: 'MM',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Colors.yellow, width: 2),
                                      ),
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: TextField(
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      hintText: 'yyyyy',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Colors.yellow, width: 2),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Security code',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          width: 150,
                          child: TextField(
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: '547',
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Colors.yellow, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.OneDay,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        title: Text('Save Card Data'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
