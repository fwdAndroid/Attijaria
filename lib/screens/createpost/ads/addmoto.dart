// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'dart:io';

import 'package:attijaria/screens/Filters/filtersappartments.dart';
import 'package:attijaria/screens/Filters/motofilters.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../Utils/constant.dart';
import '../../../Utils/getlocation.dart';
import '../../../widgets/customdialog.dart';

class MotoAds extends StatefulWidget {
  String cetagory;
   MotoAds({Key? key,required this.cetagory}) : super(key: key);

  @override
  _MotoAdsState createState() => _MotoAdsState();
}

class _MotoAdsState extends State<MotoAds> {
  TextEditingController rentalController=TextEditingController();
  TextEditingController sectorController=TextEditingController();
  TextEditingController comeController=TextEditingController();
  TextEditingController demandController=TextEditingController();
  TextEditingController cetagoryController=TextEditingController();
  TextEditingController milegaController=TextEditingController();
  TextEditingController cylinderController=TextEditingController();
  TextEditingController modelYearController=TextEditingController();
  TextEditingController originController=TextEditingController();
  TextEditingController firstHandController=TextEditingController();
  TextEditingController noOfWheelsController=TextEditingController();
  TextEditingController heightOfCellController=TextEditingController();
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

  String dropdownValueCategoryMotorcycleModel = "APRILIA";
  String dropdownValueCategoryMotorcycleColor = "Black";
  String dropdownValueCategoryMotorcycle = "Motocyclette";
  String dropDownValueCategoryMotorDetail = 'Reservoir bag';
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
        enabled: controller.text.isNotEmpty?false:true,
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
            disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
            )
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
                          "setRent":rentalController.text.trim(),
                          "Sector":sectorController.text.trim(),
                          "come": comeController.text,
                          "demander": demandController.text,
                          "Category":widget.cetagory,
                          // "cetagories":cetagoryController.text.trim(),
"address":address,
                          "mark":dropdownValueCategoryMotorcycleModel,
                          "color":dropdownValueCategoryMotorcycleColor,
                          "type":dropdownValueCategoryMotorcycle,
                          "mileage":milegaController.text.trim()
                          ,"modelYear":modelYearController.text.trim(),
                          "cylinder":cylinderController.text.trim(),
                          "origin":originController.text.trim(),
                          "firstHand":firstHandController.text.trim(),
                          "noOfWheels":noOfWheelsController.text.trim(),
                          "heightOfCell":heightOfCellController.text.trim(),
                         "additionalDetails":dropDownValueCategoryMotorDetail,
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
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              color: Colors.black,
              child: Row(
                children:  [
                  InkWell(
                    onTap: (){
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
                        _textFormFieldFunctionIcon(rentalController,RequiredValidator(errorText: "required"),'Set Rental'),
                        _titleText('Sector'),
                        _textFormFieldFunctionIcon(sectorController,RequiredValidator(errorText: "required"),'Sector'),
                        _titleText('Type of Pole'),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon(comeController,RequiredValidator(errorText: "required"),'I come')),
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon(demandController,RequiredValidator(errorText: "required"),'Demander')),
                          ],
                        ),
                        _titleText('Category'),
                        _textFormFieldFunctionIcon(cetagoryController,RequiredValidator(errorText: "required"),'Category'),
                        _titleText('Mark'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueCategoryMotorcycleModel,
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
                                  hintText: "Type of Model",
                                  fillColor: Colors.white),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueCategoryMotorcycleModel =
                                      newValue!;
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueCategoryMotorcycleColor,
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
                                  hintText: "Colors",
                                  fillColor: Colors.white),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueCategoryMotorcycleColor =
                                      newValue!;
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueCategoryMotorcycle,
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
                        _textFormFieldFunctionIcon(milegaController,RequiredValidator(errorText: "required"),'Mileage'),
                        _titleText('Model year'),
                        _textFormFieldFunctionIcon(modelYearController,RequiredValidator(errorText: "required"),'Model year'),
                        _titleText('Cylindrée (cm³)'),
                        _textFormFieldFunctionIcon(cylinderController,RequiredValidator(errorText: "required"),'Cylindrée (cm³)'),
                        _titleText('Origin'),
                        _textFormFieldFunctionIcon(originController,RequiredValidator(errorText: "required"),'Origin'),
                        _titleText('First hand'),
                        _textFormFieldFunctionIcon(firstHandController,RequiredValidator(errorText: "required"),'First hand'),
                        _titleText('Number of wheels'),
                        _textFormFieldFunctionIcon(noOfWheelsController,RequiredValidator(errorText: "required"),'Number of wheels'),
                        _titleText('Height of cell (cm)'),
                        _textFormFieldFunctionIcon(heightOfCellController,RequiredValidator(errorText: "required"),'Height of cell (cm)'),
                        _titleText('Additional Details'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: DropdownButtonFormField<String>(
                              value: dropDownValueCategoryMotorDetail,
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
                        _textFormFieldFunctionIcon(titleController,RequiredValidator(errorText: "required"),"Title"),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: _longDescription(descriptionController,"Description"),
                        ),
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
                            imageUrl==null?  Image.asset(
                                'asset/motbike.png',
                                height: 100,
                                width: 100,
                              ):Image.file(imageUrl!,
                              height: 100,
                              width: 100,),
                              
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
