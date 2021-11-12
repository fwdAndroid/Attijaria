// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:attijaria/screens/Filters/filtersappartments.dart';
import 'package:flutter/material.dart';

class RealStatePost extends StatefulWidget {
  const RealStatePost({Key? key}) : super(key: key);

  @override
  _RealStatePostState createState() => _RealStatePostState();
}

class _RealStatePostState extends State<RealStatePost> {
  RangeValues values = RangeValues(1, 100);
  String dropdownValueNews = "Sale";
  String dropdownValueBedrooms = "1";
  String dropdownValueBathrooms = "1";
  String dropdownValueFloor = "1";
  String dropdownValueAge = "1-5 years";
  String dropdownValueCategory = "Appartments";
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
        title: Text('Real State Ads'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctc) => AppartmentsFilters()));
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
                _titleText('Rent'),
                _textFormFieldFunctionIcon('Rent'),
                _titleText('Sector'),
                _textFormFieldFunctionIcon('Sector'),
                _titleText('Type of News'),
                // Type of News Drop Dow
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
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type of News",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueNews = newValue!;
                        });
                      },
                      items: <String>[
                        'Sale',
                        ' Rental',
                        'Vacine Location',
                        "Collocation",
                        "Request",
                        "Rent Request"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Category'),
                // Type of News Drop Dow
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropdownValueCategory,
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
                          hintText: "Category",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueCategory = newValue!;
                        });
                      },
                      items: <String>[
                        'Appartments',
                        ' Houses and Villas',
                        'Offices and Trays',
                        "Shops,bussiness and Industrial Premises",
                        "Land and Farms",
                        "Vacation Location",
                        "Room Mates",
                        "Others"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Address'),
                _textFormFieldFunctionIcon('Address'),
                _titleText('Bedrooms'),
                //BedRooms
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropdownValueBedrooms,
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
                          hintText: "Bedrooms",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueBedrooms = newValue!;
                        });
                      },
                      items: <String>['1', ' 2', '3', "4", "5", "Others"]
                          .map<DropdownMenuItem<String>>((String value) {
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
                      value: dropdownValueBathrooms,
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
                          hintText: "Bathrooms",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueBathrooms = newValue!;
                        });
                      },
                      items: <String>['1', ' 2', '3', "4", "5", "Others"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Trade Fairs'),
                _textFormFieldFunctionIcon('Trade Fairs'),
                _titleText('Total Surface'),
                _textFormFieldFunctionIcon('Total Surface'),
                _titleText('Floor'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropdownValueFloor,
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
                          hintText: "1",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueFloor = newValue!;
                        });
                      },
                      items: <String>['1', ' 2', '3', "4", "5", "Others"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Living Space'),
                _textFormFieldFunctionIcon('Living Space'),
                _titleText('Age of property'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropdownValueAge,
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
                          hintText: "1-5 years",
                          fillColor: Colors.white),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueAge = newValue!;
                        });
                      },
                      items: <String>[
                        '1-5 years',
                        ' 5-10 years',
                        '10-17 years',
                        "Others"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Furniture'),
                _textFormFieldFunctionIcon('Furniture'),
                _titleText('Trustee Fee / month'),
                _textFormFieldFunctionIcon('Trustee Fee / month'),
                _titleText('Fuel Type'),
                _textFormFieldFunctionIcon('Fuel Type'),
                _titleText('Additional Details'),
                _textFormFieldFunctionIcon('Additional Details'),
                _titleText('Title'),
                _textFormFieldFunctionIcon('Title'),
                _titleText('Description'),
                _longDescription('Write Product Description'),
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
                
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
