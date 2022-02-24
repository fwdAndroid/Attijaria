// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'dart:io';

import 'package:attijaria/screens/Filters/officesandtrayfilters.dart';
import 'package:attijaria/screens/Filters/rental.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:uuid/uuid.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/constant.dart';
import '../../../widgets/customdialog.dart';

class OfficesAndTraysAds extends StatefulWidget {
  String cetagory;
   OfficesAndTraysAds({Key? key,required this.cetagory}) : super(key: key);

  @override
  _OfficesAndTraysAdsState createState() => _OfficesAndTraysAdsState();
}

class _OfficesAndTraysAdsState extends State<OfficesAndTraysAds> {
  TextEditingController rentalController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController sellController = TextEditingController();
  TextEditingController requestController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController noOfPiecesController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController totalSurfaceController = TextEditingController();
  TextEditingController loftSurfaceController = TextEditingController();
  TextEditingController tursteeFeesController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final myKey = GlobalKey<FormState>();
  File? imageUrl;
  String? imageLink;
  final ImagePicker _picker = ImagePicker();
  void addImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl = File(image!.path);
    });
  }
  RangeValues values = RangeValues(1, 100);

  Widget _longDescription(TextEditingController controller, String descrop) {
    return Container(

        // ignore: prefer_const_constructors
        child: TextField(
          controller: controller,
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
      TextEditingController controller,
      String? Function(String?)? validator,
      String Active,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 10, right: 20, top: 10),
      child: TextFormField(
   controller: controller,
        validator: validator,
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
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValueCategory = "Ground floor";
    String dropdownValueAdditional = "Elevator";
    return Scaffold(
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
                onPressed: () async{
                  if(myKey.currentState!.validate()){
                    if(imageUrl==null){
                      Customdialog().showInSnackBar("Please add image", context);
                    }
                    else{
                      Customdialog.showDialogBox(context);
                      await    uploadImageToFirebase().then((v) {
                        firebaseFirestore.collection("posts").add({
                          "setRent":rentalController.text.trim(),
                          "Sector":sectorController.text.trim(),
                          "Sell": sellController.text,
                          "Request": requestController.text,
                          "Category":widget.cetagory,
                          "cetagories":categoryController.text.trim(),
                          "address":addressController.text.trim()
                          ,"noOfPieces":noOfPiecesController.text.trim(),
                          "floor":floorController.text.trim(),
                          "totalSurface":totalSurfaceController.text.trim(),
                          "loftSurface":loftSurfaceController.text.trim(),
                          "stage":dropdownValueCategory,
                          "additionalDetails":dropdownValueAdditional,
                          "title":titleController.text.trim(),
                          "description":descriptionController.text.trim(),
                          "imageLink":imageLink,
                          "minPrice":minPriceController.text.trim(),
                          "maxPrice":maxPriceController.text.trim(),
                          "phoneNumber":phoneNumberController.text.trim(),
                          "time":DateTime.now()
                          ,"isFav":false,
                        }).whenComplete(() {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Customdialog().showInSnackBar("Create a new post", context);
                        });
                      });
                    }
                  }
                },
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
      body: Form(
        key: myKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              color: Colors.black,
              child: Row(
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
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
                        _titleText('Rental'),
                        _textFormFieldFunctionIcon(rentalController,RequiredValidator(errorText: "required"), 'Set Rental'),
                        _titleText('Sector'),
                        _textFormFieldFunctionIcon(sectorController,RequiredValidator(errorText: "required"), 'Sector'),
                        _titleText('Position Type'),
                        SizedBox(
                          height: 90,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: _textFormFieldFunctionIcon(sellController,RequiredValidator(errorText: "required"), 'To Sell')),
                              Expanded(
                                  flex: 1,
                                  child: _textFormFieldFunctionIcon(requestController,RequiredValidator(errorText: "required"), 'Request')),
                            ],
                          ),
                        ),
                        _titleText('Category'),
                        _textFormFieldFunctionIcon( categoryController,RequiredValidator(errorText: "required"),'Category'),
                        _titleText('Address'),
                        _textFormFieldFunctionIcon(addressController,RequiredValidator(errorText: "required"), 'Address'),
                        _titleText('Number of pieces'),
                        _textFormFieldFunctionIcon(noOfPiecesController,RequiredValidator(errorText: "required"), 'Number of pieces'),
                        _titleText('Floor'),
                        _textFormFieldFunctionIcon(floorController,RequiredValidator(errorText: "required"), 'Floor'),
                        _titleText('Total Surface'),
                        _textFormFieldFunctionIcon(totalSurfaceController,RequiredValidator(errorText: "required"), 'Total Surface'),
                        _titleText('Loft Surface'),
                        _textFormFieldFunctionIcon(loftSurfaceController,RequiredValidator(errorText: "required"), 'Loft Surface'),
                        _titleText('Trustee fees / month'),
                        _textFormFieldFunctionIcon(tursteeFeesController,RequiredValidator(errorText: "required"), 'Trustee fees / month'),
                        _titleText('Stage'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueCategory,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(8.0),
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Stages",
                                  fillColor: Colors.white),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueCategory = newValue!;
                                });
                              },
                              items: <String>[
                                'Ground floor',
                                '1',
                                '2',
                                "3",
                                "4",
                                "5",
                                "6",
                                "7",
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
                        _titleText('Title'),
                        _textFormFieldFunctionIcon(titleController,RequiredValidator(errorText: "required"),'Title'),
                        _titleText('Description'),
                        Container(
                            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: _longDescription(descriptionController, 'Write Product Description')),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: addImage,
                                child: Image.asset(
                                  'asset/cameraimage.jpeg',
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                             imageUrl==null? Image.asset(
                                'asset/motbike.png',
                                height: 100,
                                width: 100,
                              ):Image.file(imageUrl!, height: 100,
                               width: 100,),

                            ],
                          ),
                        ),
                        _titleText('Additional Details'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 20),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueAdditional,
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Stages",
                                  fillColor: Colors.white),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueAdditional = newValue!;
                                });
                              },
                              items: <String>[
                                'Elevator',
                                'Air conditioner',
                                'Security',
                                "Heating",
                                "Balcony",
                                "Garage",
                                "Telephone wiring",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )),
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
                                child: _textFormFieldFunctionIcon(minPriceController,RequiredValidator(errorText: "required"),'Min')),
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon(maxPriceController,RequiredValidator(errorText: "required"),'Max')),
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
                        _textFormFieldFunctionIcon(phoneNumberController,RequiredValidator(errorText: "required"),'Phone Number'),
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
            ),
          ],
        ),
      ),
    );
  }
  Future uploadImageToFirebase() async {
    File? fileName = imageUrl;
    var uuid = Uuid();
    firebase_storage.Reference firebaseStorageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('cetagories/images+${uuid.v4()}');
    firebase_storage.UploadTask uploadTask =
    firebaseStorageRef.putFile(fileName!);
    firebase_storage.TaskSnapshot taskSnapshot =
    await uploadTask.whenComplete(() async {
      print(fileName);
      String img = await uploadTask.snapshot.ref.getDownloadURL();
      setState(() {
        imageLink = img;
      });
    });
  }

}
