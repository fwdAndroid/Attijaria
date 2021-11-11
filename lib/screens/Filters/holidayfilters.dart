// ignore_for_file: prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HolidaysFilters extends StatefulWidget {
  const HolidaysFilters({Key? key}) : super(key: key);

  @override
  _HolidaysFiltersState createState() => _HolidaysFiltersState();
}

enum SingingCharacter { Sale, Request }

class _HolidaysFiltersState extends State<HolidaysFilters> {
  RangeValues _currentRangeValues = RangeValues(0, 100);
  //TextFieldws
  Widget _textFormFieldFunctionIcon(
    String Active,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 10),
      child: TextField(
        autocorrect: true,
        decoration: InputDecoration(
          hintText: Active,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            //  borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.yellow, width: 2),
          ),
        ),
      ),
    );
  }

  //Text Field Title
  _titleText(String s) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 10),
      child: Text(
        s,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff18191A),
            fontStyle: FontStyle.normal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SingingCharacter? _character = SingingCharacter.Sale;

    return Scaffold(
        appBar: AppBar(
          title: Text('Holidays Filters',
              style: TextStyle(color: HexColor("#18191A"))),
          backgroundColor: HexColor('#FFFFFF'),
          // ignore: prefer_const_constructors
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: HexColor('#18191A'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 14),
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
                    hintText: ("What are looking for ?"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: HexColor('#F8B800'),
                        )),
                  ),
                ),
              ),
              _titleText('Category'),
              _textFormFieldFunctionIcon('Vocation Location'),
              _titleText('City'),
              _textFormFieldFunctionIcon('Enter the city name'),
              _titleText('Types of Ads'),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      title: Text('Rent'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Sale,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      title: Text('Request Rent'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Request,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
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
                        leading: Image.asset('asset/icons/solidmoney.png'),
                        title: Text(
                          'Price per night (DH)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 60,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: HexColor('#9098B1'),
                                  )),
                              Text('Max',
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
                        max: 100,
                        divisions: 5,
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
                        leading: Image.asset('asset/sss.png'),
                        title: Text(
                          'Area',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 120),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('1980',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: HexColor('#F8B800'),
                                  )),
                              Text('2021',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: HexColor('#F8B800'),
                                  ))
                            ]),
                      ),
                      RangeSlider(
                        activeColor: HexColor('#F8B800'),
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
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
              SizedBox(height: 10),
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
                        leading: Image.asset('asset/icons/chambres.png'),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: HexColor('#F8B800'),
                                  )),
                              Text('0',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: HexColor('#F8B800'),
                                  ))
                            ]),
                      ),
                      RangeSlider(
                        activeColor: HexColor('#F8B800'),
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
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
                        leading: Image.asset('asset/sss.png'),
                        title: Text(
                          'Area',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('1980',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: HexColor('#F8B800'),
                                  )),
                              Text('2021',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: HexColor('#F8B800'),
                                  ))
                            ]),
                      ),
                      RangeSlider(
                        activeColor: HexColor('#F8B800'),
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
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
                        leading: Image.asset('asset/icons/salons.png'),
                        title: Text(
                          'Trade Fairs',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffF8B800),
                                  )),
                              Text('500000+',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffF8B800),
                                  ))
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff9098B1),
                                  )),
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff9098B1),
                                  ))
                            ]),
                      ),
                      RangeSlider(
                        activeColor: Color(0xffF8B800),
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
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
                        leading: Image.asset('asset/icons/salles.png'),
                        title: Text(
                          'Bathrooms',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('5',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffF8B800),
                                  )),
                              Text('20+',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffF8B800),
                                  ))
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff9098B1),
                                  )),
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff9098B1),
                                  ))
                            ]),
                      ),
                      RangeSlider(
                        activeColor: Color(0xffF8B800),
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
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
              SizedBox(height: 10),
              _titleText('Additional Details'),
              _textFormFieldFunctionIcon('Additional Details'),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 2,
                        activeColor: Color(0xffF8B800),
                        onChanged: (val) {
                          //  setSelectedRadio(val);
                        },
                      ),
                      Text(
                        'Ads with images',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 2,
                        activeColor: Color(0xffF8B800),
                        onChanged: (val) {
                          //  setSelectedRadio(val);
                        },
                      ),
                      Text(
                        'Ads with price',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffF8B800)),
                      child: Text(
                        'Apply',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
