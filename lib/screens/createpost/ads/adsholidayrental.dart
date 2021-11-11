// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:attijaria/screens/Filters/holidayfilters.dart';
import 'package:attijaria/screens/Filters/vehiclefilters.dart';
import 'package:flutter/material.dart';

class AdsHoliday extends StatefulWidget {
  const AdsHoliday({Key? key}) : super(key: key);

  @override
  _AdsHolidayState createState() => _AdsHolidayState();
}

class _AdsHolidayState extends State<AdsHoliday> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  RangeValues values = RangeValues(1, 100);
  String dropDownHolidayMews = "Sale";
  String dropDownHolidayBed = "1";
  String dropDownHolidayBathRoom = "1";
  String dropDownHolidaySalon = "1";
  String dropDownHolidayEtage = "Ground floor";
  String dropDownHolidayCaution = "1 month";
  String dropDownHolidayAge = "Nine";
  String dropDownHolidayFurniture = "Furniture";
  String dropDownHolidayAdditional = "Elevator";
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: Text('Holiday Rental Ads'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctc) => HolidaysFilters()));
                },
                child: Text(
                  'Filters',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
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
                _titleText('Type of news'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownHolidayMews,
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
                          hintText: "Types of News",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownHolidayMews = newValue!;
                        });
                      },
                      items: <String>[
                        'Sale',
                        'Location',
                        'Vacation location',
                        "Collocation",
                        "Demand",
                        "Rent request",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Category'),
                _textFormFieldFunctionIcon('Category'),
                _titleText('Address'),
                _textFormFieldFunctionIcon('Address'),
                _titleText('Bedrooms'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownHolidayBed,
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
                          hintText: "Bedroom",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownHolidayBed = newValue!;
                        });
                      },
                      items: <String>[
                        '1',
                        '2',
                        '3',
                        "4",
                        "5",
                        "Other",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Bathroom'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownHolidayBathRoom,
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
                          hintText: "BathRoom",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownHolidayBathRoom = newValue!;
                        });
                      },
                      items: <String>[
                        '1',
                        '2',
                        '3',
                        "4",
                        "5",
                        "Other",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Salon'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownHolidaySalon,
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
                          hintText: "Salon",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownHolidaySalon = newValue!;
                        });
                      },
                      items: <String>[
                        '1',
                        '2',
                        '3',
                        "4",
                        "5",
                        "Other",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _textFormFieldFunctionIcon('Total surface'),
                _textFormFieldFunctionIcon('Total Surface'),
                _titleText('Etage'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownHolidayEtage,
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
                          hintText: "Etage",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownHolidayEtage = newValue!;
                        });
                      },
                      items: <String>[
                        'Ground floor',
                        '1',
                        '2',
                        '3',
                        "4",
                        "5",
                        "Other",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Surface habitable'),
                _textFormFieldFunctionIcon('Surface habitable'),
                _titleText('Caution'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownHolidayCaution,
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
                          hintText: "Etage",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownHolidayCaution = newValue!;
                        });
                      },
                      items: <String>[
                        '1 month',
                        '2 month',
                        '3 month',
                        "4 month",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Age of property'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownHolidayAge,
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
                          hintText: "Age of Property",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownHolidayAge = newValue!;
                        });
                      },
                      items: <String>[
                        'Nine',
                        '1-5 years',
                        '6-10 years',
                        "11-20 years",
                        "21 years+"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Furniture'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownHolidayFurniture,
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
                          hintText: "Furniture",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownHolidayFurniture = newValue!;
                        });
                      },
                      items: <String>[
                        'Furniture',
                        'Unfurnished',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Capacity (people)'),
                _textFormFieldFunctionIcon('Capacity (people)'),
                _titleText('Arrival Time'),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 25, right: 25),
                  width: 350,
                  height: 60,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: _selectTime,
                      child: Text(
                        'Arrival Time',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                ),
                _titleText('Departure Time'),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 25, right: 25),
                  width: 350,
                  height: 60,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: _selectTime,
                      child: Text(
                        'Departure Time',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                ),
                _titleText('Additional Details'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownHolidayAdditional,
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
                          hintText: "Additional Details",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownHolidayAdditional = newValue!;
                        });
                      },
                      items: <String>[
                        'Elevator',
                        'Balcony',
                        'Terrace',
                        "Furniture",
                        "Air conditioner",
                        "Heater",
                        "Equipped kitchen",
                        "Concierge",
                        "Security",
                        "Duplex",
                        "Garage"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Title'),
                _textFormFieldFunctionIcon('Title'),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: _longDescription('Product Description')),
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
                          'Do not Display Ads',
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
                          'Official Store',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
