// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../Utils/constant.dart';
import '../../../Utils/getlocation.dart';
import '../../../widgets/customdialog.dart';

class AdsHoliday extends StatefulWidget {
  String cetagory;
   AdsHoliday({Key? key,required this.cetagory}) : super(key: key);

  @override
  _AdsHolidayState createState() => _AdsHolidayState();
}

class _AdsHolidayState extends State<AdsHoliday> {

  TextEditingController locationController=TextEditingController();
  TextEditingController sectorController=TextEditingController();
  TextEditingController cetagoryController=TextEditingController();
  TextEditingController totalSurfaceController=TextEditingController();
  TextEditingController surfaceHabitableController=TextEditingController();
  TextEditingController capacityController=TextEditingController();
  TextEditingController firstHandController=TextEditingController();
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
  TimeOfDay _starttime = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
String departureTime="";
String arrivalTime="";
   _selectTime(int a) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
if(a==0){
  if (newTime != null) {
    setState(() {
      _time = newTime;
     arrivalTime=_time.toString();

    });
  }
}else if(a==1){
  if (newTime != null) {
    setState(() {
      _time = newTime;
departureTime=_time.toString();
    });
  }
}
  }

  String dropDownHolidayMews = "Sale";
  String dropDownHolidayBed = "1";
  String dropDownHolidayBathRoom = "1";
  String dropDownHolidaySalon = "1";
  String dropDownHolidayEtage = "Ground floor";
  String dropDownHolidayCaution = "1 month";
  String dropDownHolidayAge = "None";
  String dropDownHolidayFurniture = "Furniture";
  String dropDownHolidayAdditional = "Elevator";
  Widget _longDescription(
      TextEditingController controller,
      String descrop) {
    return Container(

        // ignore: prefer_const_constructors
        child: TextField(
          controller :controller ,
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
        enabled: controller.text.isNotEmpty?false:true,
        controller: controller,
        autocorrect: true,
        validator: validator,
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
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
          ),
        ),
      ),
    );
  }
  RangeValues rangevalues = RangeValues(1.0,10.0);
  String? address;
  void getLocation()async{
    Position  position= await  GetLocation().getLocation();
    address=await  GetLocation().getAddressFormLongitude(position);
    print(address);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  cetagoryController.text=widget.cetagory;
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                          "typeOfNews":dropDownHolidayMews,
                          "Category":widget.cetagory,
                          "address":address,
                          "bathrooms":dropDownHolidayBathRoom,
                          "bedrooms":dropDownHolidayBed,
                          "saloon":dropDownHolidaySalon
                          ,"totalSurface":totalSurfaceController.text.trim(),
                          "etage":dropDownHolidayEtage,
                          "surfaceHabitable":surfaceHabitableController.text.trim(),
                          "firstHand":firstHandController.text.trim(),
                          "caution":dropDownHolidayCaution,
                          "ageOfProperty":dropDownHolidayAge,
                          "furniture":dropDownHolidayFurniture,
                          "capacity":capacityController.text.trim(),
                          "additionalDetails":dropDownHolidayAdditional,
                          "title":titleController.text.trim(),
                          "description":descriptionController.text.trim(),
                          "imageLink":imageLink,
                          "minPrice":minPriceController.text.trim(),
                          "maxPrice":maxPriceController.text.trim(),
                          "phoneNumber":phoneNumberController.text.trim(),
                          "time":DateTime.now(),
                          "arrivalTime":arrivalTime,
                          "departureTime":departureTime,
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
      body: Form(
        key: formKey,
        child: Column(
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
                        _textFormFieldFunctionIcon(locationController,RequiredValidator(errorText: "required"),'Set Location'),
                        _titleText('Sector'),
                        _textFormFieldFunctionIcon(sectorController,RequiredValidator(errorText: "required"),'Sector'),
                        _titleText('Type of news'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
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
                        _textFormFieldFunctionIcon(cetagoryController,RequiredValidator(errorText: "required"),'Category'),
                        _titleText('Bedrooms'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
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
                        _titleText('Total surface'),
                        _textFormFieldFunctionIcon(totalSurfaceController,RequiredValidator(errorText: "required"),'Total Surface'),
                        _titleText('Etage'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
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
                        _textFormFieldFunctionIcon(surfaceHabitableController,RequiredValidator(errorText: "required"),'Surface habitable'),
                        _titleText('Caution'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
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
                                'None',
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
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
                        _textFormFieldFunctionIcon(capacityController,RequiredValidator(errorText: "required"),'Capacity (people)'),
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

                              onPressed:() async{

                                await _selectTime(0);},
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
                              // onPressed: (){},
                              onPressed: ()async{
                              await  _selectTime(1);
                              },
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
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
                        _textFormFieldFunctionIcon(titleController,RequiredValidator(errorText: "required"),'Title'),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: _longDescription(descriptionController,'Product Description')),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap:addImage,
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
                              ):Image.file(imageUrl!,
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
                                child: _textFormFieldFunctionIcon(minPriceController,RequiredValidator(errorText: "required"),'Min')),
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon(maxPriceController,RequiredValidator(errorText: "required"),'Max')),
                          ],
                        ),
                        RangeSlider(
                            values: rangevalues,
                            activeColor: Colors.yellow[700],
                            inactiveColor: Colors.black38,
                            min: 1.0,
                            max: 9999999.0,
                            // values: values,
                            onChanged: (values) {
                              setState(() {
                                rangevalues = values;
                                minPriceController.text=rangevalues.start.toInt().toString();
                                maxPriceController.text=rangevalues.end.toInt().toString();
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
