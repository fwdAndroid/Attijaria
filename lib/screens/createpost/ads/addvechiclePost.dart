// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'dart:io';
import 'package:attijaria/Utils/constant.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:uuid/uuid.dart';

class CreatePost extends StatefulWidget {
  String cetagory;
  CreatePost({Key? key, required this.cetagory}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  RangeValues values = RangeValues(1, 100);
  final formkey = GlobalKey<FormState>();
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
          ),
        ),
      ),
    );
  }

  TextEditingController rentalController = TextEditingController();
  TextEditingController sentorController = TextEditingController();
  TextEditingController sellController = TextEditingController();
  TextEditingController requestController = TextEditingController();
  TextEditingController cetagoryController = TextEditingController();
  TextEditingController carTypeController = TextEditingController();
  TextEditingController markController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController milegaController = TextEditingController();
  TextEditingController gearBoxController = TextEditingController();
  TextEditingController thumbnailController = TextEditingController();
  TextEditingController modelYearController = TextEditingController();
  TextEditingController fiscalPowerController = TextEditingController();
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController originController = TextEditingController();
  TextEditingController firstHandController = TextEditingController();
  TextEditingController colorsController = TextEditingController();
  TextEditingController additionalDetailsController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  File? imageUrl;

  String? imageLink;

  final ImagePicker _picker = ImagePicker();

  void addImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl = File(image!.path);
    });
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
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    if (imageUrl == null) {
                      Customdialog()
                          .showInSnackBar("Please add image", context);
                    } else {
                      Customdialog.showDialogBox(context);
                      await uploadImageToFirebase().then((v) {
                        firebaseFirestore.collection("posts").add({
                          "setRent": rentalController.text.trim(),
                          "Sector": sentorController.text.trim(),
                          "Sell": sellController.text,
                          "Request": requestController.text,
                          "Category": widget.cetagory,
                          "carType": carTypeController.text.trim(),
                          "mark": markController.text.trim(),
                          "model": modelController.text.trim(),
                          "mileaga": milegaController.text.trim(),
                          "gearbox": gearBoxController.text.trim(),
                          "thumbnail": thumbnailController.text.trim(),
                          "modelYear": modelYearController.text.trim(),
                          "fiscalPower": fiscalPowerController.text.trim(),
                          "fuelType": fuelTypeController.text.trim(),
                          "origin": originController.text.trim(),
                          'colors': colorsController.text.trim(),
                          "additionalDetails": additionalDetailsController.text,
                          "title": titleController.text.trim(),
                          "description": descriptionController.text.trim(),
                          "imageLink": imageLink,
                          "minPrice": minPriceController.text.trim(),
                          "maxPrice": maxPriceController.text.trim(),
                          "phoneNumber": phoneNumberController.text.trim(),
                          "time": DateTime.now(),
                          "isFav": false,
                        }).whenComplete(() {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Customdialog()
                              .showInSnackBar("Create a new post", context);
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: Colors.black,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
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
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              height: MediaQuery.of(context).size.height * 1,
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleText('Rental'),
                      _textFormFieldFunctionIcon(
                          rentalController,
                          RequiredValidator(errorText: "Required"),
                          'Set Rental'),
                      _titleText('Sector'),
                      _textFormFieldFunctionIcon(sellController,
                          RequiredValidator(errorText: "Required"), 'Sector'),
                      _titleText('Position Type'),
                      SizedBox(
                        height: 90,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon(
                                    sellController,
                                    RequiredValidator(errorText: "Required"),
                                    'Sell')),
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon(
                                    requestController,
                                    RequiredValidator(errorText: "Required"),
                                    'Request')),
                          ],
                        ),
                      ),
                      _titleText('Category'),
                      _textFormFieldFunctionIcon(cetagoryController,
                          RequiredValidator(errorText: "Required"), 'Category'),
                      _titleText('Car type'),
                      _textFormFieldFunctionIcon(carTypeController,
                          RequiredValidator(errorText: "Required"), 'Car type'),
                      _titleText('Mark'),

                      /// Drop Down Mark This is New
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "Audi",
                            "Acura",
                            "Alfa Romeo",
                            "Bentley",
                            "BYD",
                            "BMW",
                            "Cadillac",
                            "Changhe",
                            "Chery",
                            "Chevrolet",
                            "Chrysler",
                            "Citroen",
                            "Dacia",
                            "Daewoo",
                            "Daihatsu",
                            "DFSK"
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/audi.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Audi"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/acura.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Acura"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/alfa.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Alfa Romeo"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/bentley.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Bentley"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/byd.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("BYD"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/bmw.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("BMW"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/cadillac.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Cadillac"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/changhe.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Changhe"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/chery.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Chery"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/chevrolet.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Chevrolet"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/chrysler.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Chrysler"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/citroen.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Citroen"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/dacia.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Dacia"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/daw.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Daewoo"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/dai.png',
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Daihatsu"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'asset/dfs.png',
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("DFSK"),
                              ],
                            ),
                          ],
                          hint: Text("Select Mark"),
                          onChanged: print,
                        ),
                      ),

                      //Model Drop Down  This is New/////
                      _titleText('Model'),
                      // _textFormFieldFunctionIcon(modelController,
                      //     RequiredValidator(errorText: "Required"), 'Model'),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "2013",
                            "2014",
                            "2015",
                            "2016",
                            "2017",
                            "2018",
                            "2019",
                            "2020",
                            "2021",
                            "2022",
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("2013"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("2014"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("2015"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("2016"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("2017"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("2018"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("2019"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("2020"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("2021"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("2022"),
                              ],
                            ),
                          ],
                          hint: Text("Select Model"),
                          onChanged: print,
                        ),
                      ),

                      /// Drop Down Mileage This is New
                      _titleText('Mileage'),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "0 - 4999",
                            "5000-9999",
                            "10000-14999",
                            "15000-19999",
                            "20000-24999",
                            "30000-34999",
                            "35000-39999",
                            "40000-49000",
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("0 - 4999"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("5000-9999"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("10000-14999"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("15000-19999"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("20000-24999"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("30000-34999"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("35000-39999"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("40000-49000"),
                              ],
                            ),
                          ],
                          hint: Text("Select Mileage"),
                          onChanged: print,
                        ),
                      ),

                      /// Gear Box DropDown This is New
                      _titleText('Gear box'),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "Manual",
                            "Automatic",
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Manual"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Automatic"),
                              ],
                            ),
                          ],
                          hint: Text("Select Gear Type"),
                          onChanged: print,
                        ),
                      ),

                      /// Thumbnail Drop Down  This is New///
                      _titleText('Thumbnail'),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "350",
                            "650",
                            "700",
                            "1500",
                            "6000",
                            "8000",
                            "2000",
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("350"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("650"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("700"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("1500"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("6000"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("8000"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("20000"),
                              ],
                            ),
                          ],
                          hint: Text("Select ThumbNail"),
                          onChanged: print,
                        ),
                      ),

                      /// Model Year Drop Down It is New
                      _titleText('Model Year'),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "145",
                            "147 GTA",
                            "33",
                            "75",
                            "146",
                            "155",
                            "156",
                            "159",
                            "165",
                            "166",
                            "4C",
                            "8C",
                            "Brera",
                            "Gullla",
                            "Juliet",
                            "Gt",
                            "Gtv",
                            "Myth",
                            "Spider",
                            "Stelvio",
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("145"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("147 GTA"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("33"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("75"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("146"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("155"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("156"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("159"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("165"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("166"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("4C"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("8C"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Brera"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Gullla"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Juliet"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Gt"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Gtv"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Myth"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Spider"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Stelvio"),
                              ],
                            ),
                          ],
                          hint: Text("Select Model Year"),
                          onChanged: print,
                        ),
                      ),
                      // Fiscal Power DropDown This is New
                      _titleText('Fiscal power'),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "3 Hp",
                            "4 HP",
                            "5 HP",
                            "6 HP",
                            "7 HP",
                            "8 HP",
                            "9 HP",
                            "10 HP",
                            "11 HP",
                            "12 HP",
                            "13 HP",
                            "14 HP",
                            "15 HP",
                            "16 HP",
                            "17 HP",
                            "18 HP",
                            "19 HP",
                            "20 HP",
                            "21 HP",
                            "22 HP",
                            "23 HP",
                            "24 HP",
                            "25 HP",
                            "26 HP",
                            "27 HP",
                            "28 HP",
                            "29 HP",
                            "30 HP",
                            "31 HP",
                            "32 HP",
                            "33 HP",
                            "34 HP",
                            "35 HP",
                            "36 HP",
                            "37 HP",
                            "38 HP",
                            "39 HP",
                            "40 HP",
                            "41 HP",
                            "More than 41 HP",
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("3 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("4 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("5 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("6 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("7 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                               Text("8 HP"),
                              ],
                            ),
                           
                            Row(
                              children: <Widget>[
                                 Text("9 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("10 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("11 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("12 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("13 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("14 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("15 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("16 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("17 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("18 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("19 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("20 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                  Text("21 HP"),
                              ],
                            ),
                              Row(
                              children: <Widget>[
                                 Text("22 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("23 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("24 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("25 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("26 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("27 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("28 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("29 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("30 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                 Text("31 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                  Text("32 HP"),
                              ],
                            ),
                             Row(
                              children: <Widget>[
                                 Text("33 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                  Text("34 HP"),
                              ],
                            ),
                             Row(
                              children: <Widget>[
                                 Text("35 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                  Text("36 HP"),
                              ],
                            ),
                             Row(
                              children: <Widget>[
                                 Text("37 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                  Text("38 HP"),
                              ],
                            ),
                             Row(
                              children: <Widget>[
                                 Text("39 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                  Text("40 HP"),
                              ],
                            ), Row(
                              children: <Widget>[
                                 Text("41 HP"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                  Text("More than 41 HP"),
                              ],
                            ),
                          ],
                          hint: Text("Select Fiscal Power"),
                          onChanged: print,
                        ),
                      ),
                      /// Fuel Tpye Drop Down This is New
                      _titleText('Fuel Type'),
                     Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "Diesel",
                            "Gasoline",
                             "Electric",
                            "Hybrid",
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Diesel"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Gasoline"),
                              ],
                            ),
                              Row(
                              children: <Widget>[
                                Text("Electric"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Hybrid"),
                              ],
                            ),
                          ],
                          hint: Text("Select Fuel Type"),
                          onChanged: print,
                        ),
                      ),
                      /// DropDown in the Origin is the new
                      _titleText('Origin'),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "Customs clearance",
                            "Not yet cleared customs",
                             "WW in Morocco",
                            "imported new",
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Customs clearance"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Not yet cleared customs"),
                              ],
                            ),
                              Row(
                              children: <Widget>[
                                Text("WW in Morocco"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("imported new"),
                              ],
                            ),
                          ],
                          hint: Text("Select Origin"),
                          onChanged: print,
                        ),
                      ),
                       // Drop Down in First Hand This is New
                      _titleText('First hand'),
                         Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "Yes",
                            "No",
                          
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Yes"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("No"),
                              ],
                            ),
                            
                          ],
                          hint: Text("Select Hand Type"),
                          onChanged: print,
                        ),
                      ),
                      /// Drop Down Colors
                      _titleText('Colors'),
                       Container(
                        margin: EdgeInsets.only(
                            left: 20, bottom: 10, right: 20, top: 10),
                        child: DropDown<String>(
                          isExpanded: true,
                          items: <String>[
                            "White",
                            "Blue",
                            "Gray",
                            "Yellow",
                            "Black",
                            "Red",
                            "Green",
                            
                          ],
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          customWidgets: <Widget>[
                            Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                               
                               
                                Text("White"),
                                 Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                   color:Colors.white,
                                  ),
                                  
                                 
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                            Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                                
                              
                                Text("Blue"),
                                 Container(
                                    
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                   color:Colors.blue,
                                   
                                  ),),
                              ],
                            ),
                            Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                               
                              
                                Text("Gray"),
                                 Container(
                                   
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                   color:Colors.grey,
                                  ),),
                              ],
                            ),
                            Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                                
                               
                                Text("Yellow"),
                                Container(
                                   
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                   color:Colors.yellow,
                                  ),),
                              ],
                            ),
                            Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                             
                               
                                Text("Black"),
                                   Container(
                                   
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                   color:Colors.black,
                                  ),),
                              ],
                            ),
                            Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                             
                                Text("Red"),
                                 Container(
                                    
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                   color:Colors.red,
                                  ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                
                                
                                Text("Green"),
                                 Container(
                                    
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                   color:Colors.green,
                                  ),),
                              ],
                            ),
                           
                          ],
                          hint: Text("Select Color"),
                          onChanged: print,
                        ),
                      ),

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
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: _longDescription(descriptionController,
                              'Write Product Description')),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                addImage();
                              },
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
                                  ),
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
          ),
        ],
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
