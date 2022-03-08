// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'dart:io';
import 'package:attijaria/Utils/constant.dart';
import 'package:attijaria/Utils/getlocation.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:uuid/uuid.dart';
import 'package:geocoding/geocoding.dart';
class CreatePost extends StatefulWidget {
  String cetagory;
   CreatePost({Key? key,required this.cetagory}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {


  RangeValues rangevalues = RangeValues(1.0,10.0);
final formkey=GlobalKey<FormState>();
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
          ),
            disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
            )
        ),
      ),
    );
  }

  TextEditingController rentalController=TextEditingController();
  TextEditingController sentorController=TextEditingController();
  TextEditingController sellController=TextEditingController();
  TextEditingController requestController=TextEditingController();
  TextEditingController cetagoryController=TextEditingController();
  TextEditingController carTypeController=TextEditingController();
  TextEditingController markController=TextEditingController();
  TextEditingController modelController=TextEditingController();
  TextEditingController milegaController=TextEditingController();
  TextEditingController gearBoxController=TextEditingController();
  TextEditingController thumbnailController=TextEditingController();
  TextEditingController modelYearController=TextEditingController();
  TextEditingController fiscalPowerController=TextEditingController();
  TextEditingController fuelTypeController=TextEditingController();
  TextEditingController originController=TextEditingController();
  TextEditingController firstHandController=TextEditingController();
  TextEditingController colorsController=TextEditingController();
  TextEditingController additionalDetailsController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController minPriceController=TextEditingController();
  TextEditingController maxPriceController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();

  File? imageUrl;

  String? imageLink;

  final ImagePicker _picker = ImagePicker();

  void addImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl = File(image!.path);
    });
  }
String? address;
@override
  void initState(){
    // TODO: implement initState
    super.initState();
    cetagoryController.text=widget.cetagory;
   getLocation();

}
void getLocation()async{
Position  position= await  GetLocation().getLocation();
   address=await  GetLocation().getAddressFormLongitude(position);
print(address);
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
                  if(formkey.currentState!.validate()){
                    if(imageUrl==null){
                      Customdialog().showInSnackBar("Please add image", context);
                    }
                    else{
                      Customdialog.showDialogBox(context);
                await    uploadImageToFirebase().then((v) {
                        firebaseFirestore.collection("posts").add({
                          "setRent":rentalController.text.trim(),
                          "Sector":sentorController.text.trim(),
                          "Sell": sellController.text,
                          "Request": requestController.text,
                          "Category":widget.cetagory,
                          "carType":carTypeController.text.trim()
                          ,"mark":markController.text.trim(),
                          "model":modelController.text.trim(),
                          "mileaga":milegaController.text.trim(),
                          "gearbox":gearBoxController.text.trim(),
                          "thumbnail":thumbnailController.text.trim(),
                          "modelYear":modelYearController.text.trim(),
                          "fiscalPower":fiscalPowerController.text.trim(),
                          "fuelType":fuelTypeController.text.trim(),
                          "origin":originController.text.trim(),
                          'colors':colorsController.text.trim(),
                          "additionalDetails":additionalDetailsController.text,
                          "title":titleController.text.trim(),
                          "description":descriptionController.text.trim(),
                          "imageLink":imageLink,
                          "minPrice":minPriceController.text.trim(),
                          "maxPrice":maxPriceController.text.trim(),
                          "phoneNumber":phoneNumberController.text.trim(),
                          "address":address,
                          "time":DateTime.now()
                     ,"isFav":false
                          , "userId":firebaseAuth.currentUser!.uid
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: Colors.black,
            child: Row(
              children: [
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
                      _textFormFieldFunctionIcon(rentalController,RequiredValidator(errorText: "Required"),'Set Rental'),
                      _titleText('Sector'),
                      _textFormFieldFunctionIcon(sentorController,RequiredValidator(errorText: "Required"),'Sector'),
                      _titleText('Position Type'),
                      SizedBox(
                        height: 90,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon(sellController,RequiredValidator(errorText: "Required"),'Sell')),
                            Expanded(
                                flex: 1,
                                child: _textFormFieldFunctionIcon(requestController,RequiredValidator(errorText: "Required"), 'Request')),
                          ],
                        ),
                      ),
                      _titleText('Category'),
                      _textFormFieldFunctionIcon(cetagoryController,RequiredValidator(errorText: "Required"), 'Category'),
                      _titleText('Car type'),
                      _textFormFieldFunctionIcon(carTypeController,RequiredValidator(errorText: "Required"), 'Car type'),
                      _titleText('Mark'),
                      _textFormFieldFunctionIcon(markController,RequiredValidator(errorText: "Required"), 'Mark'),
                      _titleText('Model'),
                      _textFormFieldFunctionIcon(modelController,RequiredValidator(errorText: "Required"),'Model'),
                      _titleText('Mileage'),
                      _textFormFieldFunctionIcon(milegaController,RequiredValidator(errorText: "Required"),'Mileage'),
                      _titleText('Gear box'),
                      _textFormFieldFunctionIcon(gearBoxController,RequiredValidator(errorText: "Required"),'Gear box'),
                      _titleText('Thumbnail'),
                      _textFormFieldFunctionIcon(thumbnailController,RequiredValidator(errorText: "Required"),'Thumbnail'),
                      _titleText('Model Year'),
                      _textFormFieldFunctionIcon(modelYearController,RequiredValidator(errorText: "Required"),'Model Year'),
                      _titleText('Fiscal power'),
                      _textFormFieldFunctionIcon(fiscalPowerController,RequiredValidator(errorText: "Required"), 'Fiscal power'),
                      _titleText('Fuel Type'),
                      _textFormFieldFunctionIcon(fuelTypeController,RequiredValidator(errorText: "Required"),'Fuel Type'),
                      _titleText('Origin'),
                      _textFormFieldFunctionIcon(originController,RequiredValidator(errorText: "Required"),'Origin'),
                      _titleText('First hand'),
                      _textFormFieldFunctionIcon(firstHandController,RequiredValidator(errorText: "Required"),'First hand'),
                      _titleText('Colors'),
                      _textFormFieldFunctionIcon(colorsController,RequiredValidator(errorText: "Required"),'Colors'),
                      _titleText('Additional Details'),
                      _textFormFieldFunctionIcon(additionalDetailsController,RequiredValidator(errorText: "Required"),'Additional Details'),
                      _titleText('Title'),
                      _textFormFieldFunctionIcon(titleController,RequiredValidator(errorText: "Required"),'Title'),
                      _titleText('Description'),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: _longDescription(descriptionController,'Write Product Description')),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: ()async{
                                addImage();
                              },
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
                            ):Image.file(imageUrl!,                              height: 100,
                             width: 100,),
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
                              child: _textFormFieldFunctionIcon(minPriceController,RequiredValidator(errorText: "Required"),'Min')),
                          Expanded(
                              flex: 1,
                              child: _textFormFieldFunctionIcon(maxPriceController,RequiredValidator(errorText: "Required"),'Max')),
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
                              rangevalues= values;
                              minPriceController.text=rangevalues.start.toInt().toString();
                              maxPriceController.text=rangevalues.end.toInt().toString();

                            });
                          },
                       // value: rangevalues,
                     ),
                      _titleText(' Phone Number'),
                      _textFormFieldFunctionIcon(phoneNumberController,RequiredValidator(errorText: "Required"),'Phone Number'),
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
