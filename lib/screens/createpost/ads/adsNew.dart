// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'dart:io';

import 'package:attijaria/screens/Filters/holidayfilters.dart';
import 'package:attijaria/screens/Filters/telephone.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../Utils/constant.dart';
import '../../../widgets/customdialog.dart';

class AdsNews extends StatefulWidget {
  String cetagory;
   AdsNews({Key? key,required this.cetagory}) : super(key: key);

  @override
  _AdsNewsState createState() => _AdsNewsState();
}
class _AdsNewsState extends State<AdsNews> {
  TextEditingController locationController=TextEditingController();
  TextEditingController sectorController=TextEditingController();
  TextEditingController minController=TextEditingController();
  TextEditingController maxController=TextEditingController();
  TextEditingController cetagoryController=TextEditingController();
  TextEditingController milegaController=TextEditingController();
  TextEditingController marqueeController=TextEditingController();
  TextEditingController modelYearController=TextEditingController();
  TextEditingController storageCapacityCellController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController minPriceController=TextEditingController();
  TextEditingController maxPriceController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  final formKey=GlobalKey<FormState>();
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
  String dropdownValueElat = "Nine";
  Widget _longDescription(
      TextEditingController controller,
      String descrop) {
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
            borderSide: BorderSide(color: Colors.grey, width: 2),
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
                onPressed: ()async {
                  if(formKey.currentState!.validate()){
                    if(imageUrl==null){
                      Customdialog().showInSnackBar("Please add image", context);
                    }
                    else{
                      Customdialog.showDialogBox(context);
                      await    uploadImageToFirebase().then((v) {
                        firebaseFirestore.collection("posts").add({
                          "location":locationController.text.trim(),
                          "Sector":sectorController.text.trim(),
                          "min":minController,
                          "max":maxController,
                          "Category":widget.cetagory,
                          "cetagories":cetagoryController.text.trim(),
                          "marqee":marqueeController.text.trim(),
                          "elat":dropdownValueElat,
                          "storageCapacity":storageCapacityCellController.text.trim(),
                          "title":titleController.text.trim(),
                          "description":descriptionController.text.trim(),
                          "imageLink":imageLink,
                          "minPrice":minPriceController.text.trim(),
                          "maxPrice":maxPriceController.text.trim(),
                          "phoneNumber":phoneNumberController.text.trim(),
                          "time":DateTime.now(),
                          "isFav":false
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: const Radius.circular(30.0),
          ),
        ),
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleText('Location'),
                _textFormFieldFunctionIcon(locationController,RequiredValidator(errorText: "required"),'Set Location'),
                _titleText('Sector'),
                _textFormFieldFunctionIcon(sectorController,RequiredValidator(errorText: "required"),'Sector'),
                _titleText('Type of Post'),
                Row(
                  children: [
                    Expanded(flex: 1, child: _textFormFieldFunctionIcon(minController,RequiredValidator(errorText: "required"),'Min')),
                    Expanded(flex: 1, child: _textFormFieldFunctionIcon(maxController,RequiredValidator(errorText: "required"),'Max')),
                  ],
                ),
                _titleText('Category'),
                _textFormFieldFunctionIcon(cetagoryController,RequiredValidator(errorText: "required"),'Category'),
                _titleText('Marque'),
                _textFormFieldFunctionIcon(marqueeController,RequiredValidator(errorText: "required"),'Marque'),
                _titleText('Elat'),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropdownValueElat,
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
                          dropdownValueElat = newValue!;
                        });
                      },
                      items: <String>[
                        'Nine',
                        'Reconditioned',
                        'Good condition',
                        "For Piece",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                _titleText('Storage capacity'),
                _textFormFieldFunctionIcon(storageCapacityCellController,RequiredValidator(errorText: "required"),'Storage capacity'),
                _titleText('Title'),
                _textFormFieldFunctionIcon(titleController,RequiredValidator(errorText: "required"),'Title'),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: _longDescription(descriptionController,'Product Description')),
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
                _titleText('Prix DH'),
                Row(
                  children: [
                    Expanded(flex: 1, child: _textFormFieldFunctionIcon(minPriceController,RequiredValidator(errorText: "required"),'Min')),
                    Expanded(flex: 1, child: _textFormFieldFunctionIcon(maxPriceController,RequiredValidator(errorText: "required"),'Max')),
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
              ],
            ),
          ),
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
