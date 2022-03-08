// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';
import 'package:attijaria/screens/Filters/filtersappartments.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/constant.dart';
import '../../../Utils/getlocation.dart';
import '../../../widgets/customdialog.dart';

class RealStatePost extends StatefulWidget {
  String cetagory;
   RealStatePost({Key? key,required this.cetagory}) : super(key: key);

  @override
  _RealStatePostState createState() => _RealStatePostState();
}

class _RealStatePostState extends State<RealStatePost> {
  TextEditingController rentalController = TextEditingController();
  TextEditingController sentorController = TextEditingController();
  TextEditingController tradeFairsController = TextEditingController();
  TextEditingController totalSurfaceController = TextEditingController();
  TextEditingController livingSpaceController = TextEditingController();
  TextEditingController furnitureController = TextEditingController();
  TextEditingController tursteeFeeController = TextEditingController();
  TextEditingController additionalDetailsController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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

  String dropdownValueNews = "Sale";
  String dropdownValueBedrooms = "1";
  String dropdownValueBathrooms = "1";
  String dropdownValueFloor = "1";
  String dropdownValueAge = "1-5 years";
  String dropdownValueCategory = "Appartments";
  Widget _longDescription(
      TextEditingController controller,
      String descrop) {
    return Container(

        // ignore: prefer_const_constructors
        child: TextFormField(
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
                          "Sector":sentorController.text.trim(),
                          "Sale": dropdownValueNews,
                          "cetagories":dropdownValueCategory,
                          "address":address??"",
                          "bedrooms": dropdownValueBedrooms,
                          "bathrooms": dropdownValueBathrooms,
                          "Category":widget.cetagory,
                          "tradeFair":tradeFairsController.text.trim()
                          ,"floor":dropdownValueFloor,
                          "livigSpace":livingSpaceController.text.trim(),
                          "ageOfProperty":dropdownValueAge,
                          "furniture":furnitureController.text.trim(),
                          "trusteeFee":tursteeFeeController.text.trim(),
                          "additionalDetails":additionalDetailsController.text,
                          "title":titleController.text.trim(),
                          "description":descriptionController.text.trim(),
                          "imageLink":imageLink,
                          "minPrice":minPriceController.text.trim(),
                          "maxPrice":maxPriceController.text.trim(),
                          "phoneNumber":phoneNumberController.text.trim(),
                          "time":DateTime.now()
                   ,"isFav":false
                          , "userId":firebaseAuth.currentUser!.uid}).whenComplete(() {
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
                        _titleText('Rent'),
                        _textFormFieldFunctionIcon(rentalController,
                            RequiredValidator(errorText: "Required"), 'Rent'),
                        _titleText('Sector'),
                        _textFormFieldFunctionIcon(sentorController,
                            RequiredValidator(errorText: "Required"), 'Sector'),
                        _titleText('Type of News'),
                        // Type of News Drop Dow
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueNews,
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
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
                        // _titleText('Address'),
                        // _textFormFieldFunctionIcon(addressController,
                        //     RequiredValidator(errorText: "Required"), 'Address'),
                        _titleText('Bedrooms'),
                        //BedRooms
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueBedrooms,
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueBathrooms,
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
                        _textFormFieldFunctionIcon(
                            tradeFairsController,
                            RequiredValidator(errorText: "Required"),
                            'Trade Fairs'),
                        _titleText('Total Surface'),
                        _textFormFieldFunctionIcon(
                            totalSurfaceController,
                            RequiredValidator(errorText: "Required"),
                            'Total Surface'),
                        _titleText('Floor'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueFloor,
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
                        _textFormFieldFunctionIcon(
                            livingSpaceController,
                            RequiredValidator(errorText: "Required"),
                            'Living Space'),
                        _titleText('Age of property'),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValueAge,
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
                        _textFormFieldFunctionIcon(
                            furnitureController,
                            RequiredValidator(errorText: "Required"),
                            'Furniture'),
                        _titleText('Trustee Fee / month'),
                        _textFormFieldFunctionIcon(
                            tursteeFeeController,
                            RequiredValidator(errorText: "Required"),
                            'Trustee Fee / month'),

                        _titleText('Additional Details'),
                        _textFormFieldFunctionIcon(
                            additionalDetailsController,
                            RequiredValidator(errorText: "Required"),
                            'Additional Details'),
                        _titleText('Title'),
                        _textFormFieldFunctionIcon(titleController,
                            RequiredValidator(errorText: "Required"), 'Title'),
                        _titleText('Description'),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: _longDescription(
                                descriptionController,
                                'Write Product Description')),
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
                              imageUrl == null
                                  ? Image.asset(
                                      'asset/motbike.png',
                                      height: 100,
                                      width: 100,
                                    )
                                  : Image.file(
                                      imageUrl!,
                                      height: 100,
                                      width: 100,
                                    )
                              // Image.asset(
                              //   'asset/motbike.png',
                              //   height: 100,
                              //   width: 100,
                              // ),
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
                                child: _textFormFieldFunctionIcon(
                                    minPriceController,
                                    RequiredValidator(errorText: "Required"),
                                    'Min')),
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon(
                                    maxPriceController,
                                    RequiredValidator(errorText: "Required"),
                                    'Max')),
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
                        _textFormFieldFunctionIcon(
                            phoneNumberController,
                            RequiredValidator(errorText: "Required"),
                            'Phone Number'),
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
