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
        child: TextField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration(
        // isDense: true,
        contentPadding: const EdgeInsets.all(20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        hintText: descrop,
        hintStyle: TextStyle(color: Colors.black),
      ),
    ));
  }

  Widget _textFormFieldFunctionIcon(
    String Active,
  ) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        autofocus: false,
        style: TextStyle(fontSize: 15.0, color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: Active,
          filled: true,
          fillColor: Colors.grey,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
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
        title: Text('Create a post'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          SingleChildScrollView(
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              // semanticContainer: true,
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//_titleText('Location'),
                  _textFormFieldFunctionIcon('set Location'),
                  //   _titleText('Sector'),
                  _textFormFieldFunctionIcon('Sector'),
                  //    _titleText('Position Type'),
                  SizedBox(
                    height: 90,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1, child: _textFormFieldFunctionIcon('Sell')),
                        Expanded(
                            flex: 1,
                            child: _textFormFieldFunctionIcon('Request')),
                      ],
                    ),
                  ),
                  //   _titleText('Marque'),
                  _textFormFieldFunctionIcon('Marque'),

                  ///  _titleText('Model'),
                  _textFormFieldFunctionIcon('Model'),
                  //    _titleText('Kilometer Range'),
                  _textFormFieldFunctionIcon('Kilometer Range'),
                  // _titleText('Boite vitesses'),
                  _textFormFieldFunctionIcon('Boite vitesses'),
                  //  _titleText('vignette'),
                  _textFormFieldFunctionIcon('vignette'),
                  //    _titleText('Annee Modele'),
                  _textFormFieldFunctionIcon('Annee Modele'),
//_titleText('puissance fiscals'),
                  _textFormFieldFunctionIcon('puissance fiscals'),
                  //  _titleText('Typr de carburant'),
                  _textFormFieldFunctionIcon('Typr de carburant'),
                  //  _titleText('Origine'),
                  _textFormFieldFunctionIcon('Origine'),
                  //   _titleText('Premiere main'),
                  _textFormFieldFunctionIcon('Premiere main'),
                  //   _titleText('Couleures'),
                  _textFormFieldFunctionIcon('Couleures'),
                  //  _titleText('Details supplemataires'),
                  _textFormFieldFunctionIcon('Details supplemataires'),
                  //   _titleText('Title'),
                  _textFormFieldFunctionIcon('Title'),
                  //   _titleText('Description'),
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

                  //       _titleText('Price DH'),
                  Row(
                    children: [
                      Expanded(
                          flex: 1, child: _textFormFieldFunctionIcon('Min')),
                      Expanded(
                          flex: 1, child: _textFormFieldFunctionIcon('Max')),
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
                  //    _titleText('Enter Phone Number'),
                  _textFormFieldFunctionIcon('Phone Number'),
                  ElevatedButton(
                    child: const Text('Apply'),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Booster()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
