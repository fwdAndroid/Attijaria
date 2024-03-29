import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AgricultureFilters extends StatefulWidget {
  const AgricultureFilters({Key? key}) : super(key: key);

  @override
  _AgricultureFiltersState createState() => _AgricultureFiltersState();
}

class _AgricultureFiltersState extends State<AgricultureFilters> {
  RangeValues _currentRangeValues = const RangeValues(0, 9000000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    primary: Color(0xffF8B800), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Agriculture Filters',
              style: TextStyle(color: HexColor("#18191A"))),
          backgroundColor: HexColor('#FFFFFF'),
          leading: Icon(
            Icons.close,
            color: HexColor('#18191A'),
          ),
          actions: const [
            Padding(
                padding: EdgeInsets.only(
                  right: 20,
                ),
                child: Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 85,
            width: MediaQuery.of(context).size.width / .5,
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: TextField(
              style: TextStyle(
                color: HexColor('#9098B1'),
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                // ignore: prefer_const_constructors
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#9098B1'))),
                // ignore: prefer_const_constructors
                hintText: ("Que recherchez vous ?"),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: HexColor('#F8B800'),
                    )),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Category',
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / .5,
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              style: TextStyle(
                color: HexColor('#9098B1'),
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                // ignore: prefer_const_constructors
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#9098B1'))),
                // ignore: prefer_const_constructors
                hintText: ("Engine BTP"),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: HexColor('#F8B800'),
                    )),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'City',
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / .5,
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              style: TextStyle(
                color: HexColor('#9098B1'),
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                // ignore: prefer_const_constructors
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#9098B1'))),
                // ignore: prefer_const_constructors
                hintText: ("City"),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: HexColor('#F8B800'),
                    )),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 20, left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Type of News',
              )),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: 2,
                activeColor: HexColor('#F8B800'),
                onChanged: (val) {
                  //  setSelectedRadio(val);
                },
              ),
              Text('Vente'),
              SizedBox(
                width: 100,
              ),
              Radio(
                value: 1,
                groupValue: 2,
                activeColor: HexColor('#F8B800'),
                onChanged: (val) {
                  //  setSelectedRadio(val);
                },
              ),
              Text('Demande'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  )),
              // prix slider
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 30),
                    leading: Image.asset('asset/money.png'),
                    title: Text(
                      'Prix (DH)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55, right: 140),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('min',
                              style: TextStyle(
                                fontSize: 10,
                                color: HexColor('#9098B1'),
                              )),
                          Text('min',
                              style: TextStyle(
                                fontSize: 10,
                                color: HexColor('#9098B1'),
                              ))
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3.7,
                        height: 40,
                        child: TextField(
                          style: TextStyle(
                            color: HexColor('#9098B1'),
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // ignore: prefer_const_constructors
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor('#9098B1'))),
                            // ignore: prefer_const_constructors
                            hintText: ("0"),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: HexColor('#F8B800'),
                                )),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: 40,
                        child: TextField(
                          style: TextStyle(
                            color: HexColor('#9098B1'),
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // ignore: prefer_const_constructors
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor('#9098B1'))),
                            // ignore: prefer_const_constructors
                            hintText: ("9000000"),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: HexColor('#F8B800'),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RangeSlider(
                    activeColor: HexColor('#F8B800'),
                    values: _currentRangeValues,
                    min: 0,
                    max: 9000000,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 30),
                            leading: Image.asset('asset/vector.png'),
                            title: Text(
                              'Model Year',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('0',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: HexColor('#F8B800'),
                                      )),
                                  Text('500000+',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: HexColor('#F8B800'),
                                      ))
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('min',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: HexColor('#9098B1'),
                                      )),
                                  Text('min',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: HexColor('#9098B1'),
                                      ))
                                ]),
                          ),
                          RangeSlider(
                            activeColor: HexColor('#F8B800'),
                            values: _currentRangeValues,
                            min: 0,
                            max: 9000000,
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(top: 20, left: 10),
              alignment: Alignment.centerLeft,
              child: Text('Fuel Type')),
          Container(
            width: MediaQuery.of(context).size.width / .5,
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              style: TextStyle(
                color: HexColor('#9098B1'),
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                // ignore: prefer_const_constructors
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#9098B1'))),
                // ignore: prefer_const_constructors
                hintText: ("Gear Box"),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: HexColor('#F8B800'),
                    )),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 30),
                    leading: Image.asset('asset/icons/solidmoney.png'),
                    title: Text(
                      'Tax Power (CV)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('5',
                              style: TextStyle(
                                fontSize: 18,
                                color: HexColor('#F8B800'),
                              )),
                          Text('1800+',
                              style: TextStyle(
                                fontSize: 18,
                                color: HexColor('#F8B800'),
                              ))
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('min',
                              style: TextStyle(
                                fontSize: 10,
                                color: HexColor('#9098B1'),
                              )),
                          Text('min',
                              style: TextStyle(
                                fontSize: 10,
                                color: HexColor('#9098B1'),
                              ))
                        ]),
                  ),
                  RangeSlider(
                    activeColor: HexColor('#F8B800'),
                    values: _currentRangeValues,
                    min: 0,
                    max: 9000000,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 2,
                    activeColor: HexColor('#F8B800'),
                    onChanged: (val) {
                      //  setSelectedRadio(val);
                    },
                  ),
                  Text('Ads with images'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 2,
                    activeColor: HexColor('#F8B800'),
                    onChanged: (val) {
                      //  setSelectedRadio(val);
                    },
                  ),
                  Text('Ads with prices'),
                ],
              ),
            ],
          ),
        ])));
  }
}
