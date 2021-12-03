// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  RangeValues values = RangeValues(1, 100);

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
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey, width: 2),
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
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
        leading: Icon(Icons.settings),
        elevation: 0,
        title: Text('Actuators'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: Colors.black,
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Create a post',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              height: MediaQuery.of(context).size.height * 1,
              child: ListView(children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleText('Rental'),
                      _textFormFieldFunctionIcon('Set Rental'),
                      _titleText('Sector'),
                      _textFormFieldFunctionIcon('Sector'),
                      _titleText('Position Type'),
                      SizedBox(
                        height: 90,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon('Sell')),
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon('Request')),
                          ],
                        ),
                      ),
                      _titleText('Category'),
                      _textFormFieldFunctionIcon('Category'),
                      _titleText('Car type'),
                      _textFormFieldFunctionIcon('Car type'),
                      _titleText('Mark'),
                      _textFormFieldFunctionIcon('Mark'),
                      _titleText('Model'),
                      _textFormFieldFunctionIcon('Model'),
                      _titleText('Mileage'),
                      _textFormFieldFunctionIcon('Mileage'),
                      _titleText('Gear box'),
                      _textFormFieldFunctionIcon('Gear box'),
                      _titleText('Thumbnail'),
                      _textFormFieldFunctionIcon('Thumbnail'),
                      _titleText('Model Year'),
                      _textFormFieldFunctionIcon('Model Year'),
                      _titleText('Fiscal power'),
                      _textFormFieldFunctionIcon('Fiscal power'),
                      _titleText('Fuel Type'),
                      _textFormFieldFunctionIcon('Fuel Type'),
                      _titleText('Origin'),
                      _textFormFieldFunctionIcon('Origin'),
                      _titleText('First hand'),
                      _textFormFieldFunctionIcon('First hand'),
                      _titleText('Colors'),
                      _textFormFieldFunctionIcon('Colors'),
                      _titleText('Additional Details'),
                      _textFormFieldFunctionIcon('Additional Details'),
                      _titleText('Title'),
                      _textFormFieldFunctionIcon('Title'),
                      _titleText('Description'),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: _longDescription('Write Product Description')),
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
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'MIN',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              'Max',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: _textFormFieldFunctionIcon('Min')),
                          Expanded(
                              flex: 1,
                              child: _textFormFieldFunctionIcon('Max')),
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
          ),
        ],
      ),
    );
  }
}
