// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:attijaria/screens/Filters/filtersappartments.dart';
import 'package:attijaria/screens/Filters/motofilters.dart';
import 'package:flutter/material.dart';

class MotoAds extends StatefulWidget {
  const MotoAds({Key? key}) : super(key: key);

  @override
  _MotoAdsState createState() => _MotoAdsState();
}

class _MotoAdsState extends State<MotoAds> {
  RangeValues values = RangeValues(1, 100);
  String dropdownValueCategoryMotorcycleModel = "APRILIA";
  String dropdownValueCategoryMotorcycleColor = "Black";
  String dropdownValueCategoryMotorcycle = "Motocyclette";
  String dropDownValueCategoryMotorDetail = 'Reservoir bag';
  Widget _longDescription(String descrop) {
    return Container(

        // ignore: prefer_const_constructors
        child: TextField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'Write A Product Description',
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white70,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.yellow, width: 2),
        ),
      ),
    ));
  }

//Text Field Title
  _titleText(String s) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20),
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

//TextFieldws
  Widget _textFormFieldFunctionIcon(
    String Active,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 10, right: 20, top: 10),
      child: TextField(
        autocorrect: true,
        decoration: InputDecoration(
          hintText: Active,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.yellow, width: 2),
          ),
        ),
      ),
    );
  }

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
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: Text('MotoCycle Ads'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: const Radius.circular(30.0),
          ),
        ),
        height: MediaQuery.of(context).size.height * 1,
        child: ListView(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleText('Location'),
                _textFormFieldFunctionIcon('Set Location'),
                _titleText('Sector'),
                _textFormFieldFunctionIcon('Sector'),
                _titleText('Type of Pole'),
                Row(
                  children: [
                    Expanded(
                        flex: 1, child: _textFormFieldFunctionIcon('I come')),
                    Expanded(
                        flex: 1, child: _textFormFieldFunctionIcon('Demander')),
                  ],
                ),
                _titleText('Category'),
                _textFormFieldFunctionIcon('Category'),
                _titleText('Mark'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropdownValueCategoryMotorcycleModel,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type of Model",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueCategoryMotorcycleModel = newValue!;
                        });
                      },
                      items: <String>[
                        'APRILIA',
                        'BENELLI',
                        'BMW',
                        "CAN-AM",
                        "CF MOTO",
                        "DUCATI",
                        "E-MOTO",
                        'EI-HEI',
                        'FB MONDIAL',
                        'HARLEY-DAVIDSON',
                        "HONDA",
                        "KAWASAKI",
                        "KTM",
                        'KYMCO',
                        'MASH',
                        'MOTO GUZZI',
                        "OBA MOTORS",
                        "PEUGEOT",
                        "PHOENIX",
                        'PIAGGIO',
                        'ROYAL ENFIELD',
                        'SUZUKI',
                        "SYM",
                        "TAKADO",
                        "TGB",
                        "VESPA",
                        "VOGE",
                        "YADEA",
                        "YAMAHA",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Color'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropdownValueCategoryMotorcycleColor,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Colors",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueCategoryMotorcycleColor = newValue!;
                        });
                      },
                      items: <String>[
                        'Black',
                        'GREY',
                        'Yellow',
                        "RED",
                        "GREEN",
                        "Argent",
                        "Beige",
                        'Egg shell',
                        'Bordeaux',
                        'Light blue',
                        "Navy blue",
                        "Bronze",
                        "Light gray",
                        'Dark gray',
                        'Charcoal grey',
                        'Ivory',
                        "Marron",
                        "Light brown",
                        "Metalized",
                        'Or',
                        'Orange',
                        'Dark red',
                        "Rose",
                        "Pink",
                        "Dark green",
                        "Violet",
                        "Tuning",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Type'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropdownValueCategoryMotorcycle,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueCategoryMotorcycle = newValue!;
                        });
                      },
                      items: <String>[
                        'Motocyclette',
                        'Scooter',
                        'Maxi Scooter',
                        "Roadster",
                        "Cruiser",
                        "Sportive",
                        "Road",
                        'Trail',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Mileage'),
                _textFormFieldFunctionIcon('Mileage'),
                _titleText('Model year'),
                _textFormFieldFunctionIcon('Model year'),
                _titleText('Cylindrée (cm³)'),
                _textFormFieldFunctionIcon('Cylindrée (cm³)'),
                _titleText('Origin'),
                _textFormFieldFunctionIcon('Origin'),
                _titleText('First hand'),
                _textFormFieldFunctionIcon('First hand'),
                _titleText('Number of wheels'),
                _textFormFieldFunctionIcon('Number of wheels'),
                _titleText('Height of cell (cm)'),
                _textFormFieldFunctionIcon('Height of cell (cm)'),
                _titleText('Additional Details'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownValueCategoryMotorDetail,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Additional Detail",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValueCategoryMotorDetail = newValue!;
                        });
                      },
                      items: <String>[
                        'Reservoir bag',
                        'Anti-theft',
                        'Low bubble',
                        "ABS / CBS",
                        "CD / MP3 / Bluetooth",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Title'),
                _textFormFieldFunctionIcon("Title"),
                _longDescription("Description"),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/cameraimage.jpeg',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'asset/motbike.png',
                        height: 100,
                        width: 100,
                      ),
                      Image.asset(
                        'asset/motbike.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _titleText('Price DH'),
                Row(
                  children: [
                    Expanded(flex: 1, child: _textFormFieldFunctionIcon('Min')),
                    Expanded(flex: 1, child: _textFormFieldFunctionIcon('Max')),
                  ],
                ),
                RangeSlider(
                    values: values,
                    activeColor: Colors.yellow[700],
                    inactiveColor: Colors.black38,
                    min: 1,
                    max: 100,
                    // values: values,
                    onChanged: (values) {
                      setState(() {
                        values = values;
                      });
                    }),
                _titleText(' Phone Number'),
                _textFormFieldFunctionIcon('Phone Number'),
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
                          'Do not display address',
                          style: TextStyle(
                            color: Colors.black,
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
                          'Boost the ads',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
