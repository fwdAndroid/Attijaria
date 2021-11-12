// ignore_for_file: prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Telephone extends StatefulWidget {
  const Telephone({Key? key}) : super(key: key);

  @override
  _TelephoneState createState() => _TelephoneState();
}

enum SingingCharacter { Sale, Request }

class _TelephoneState extends State<Telephone> {
  RangeValues _currentRangeValues = RangeValues(0, 100);
  String dropdownValueNews = "Sale";
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
          title: Text('Telephone Filters',
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
              _textFormFieldFunctionIcon('Category'),
              _titleText('City'),
              _textFormFieldFunctionIcon('Enter the city name'),
              _titleText('Types of News'),
              Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: DropdownButtonFormField<String>(
                    value: dropdownValueNews,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Colors.pinkAccent),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Sale",
                        fillColor: Colors.white),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueNews = newValue!;
                      });
                    },
                    items: <String>[
                      'Sale',
                      ' Rent',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),

              _titleText('Marque'),
              _textFormFieldFunctionIcon('Marque'),
              _titleText('Model'),
              _textFormFieldFunctionIcon('Model'),
              _titleText('Elat'),
              _textFormFieldFunctionIcon('Elat'),
              // ignore: prefer_const_constructors
              _titleText('Storage capacity'),
              _textFormFieldFunctionIcon('Storage capacity'),
              SizedBox(height: 10),
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
                ],
              ),
            ],
          ),
        ));
  }
}
