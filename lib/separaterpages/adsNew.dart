// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'dart:io';

import 'package:attijaria/screens/Filters/holidayfilters.dart';
import 'package:attijaria/screens/Filters/telephone.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../Utils/constant.dart';
import '../../../Utils/getlocation.dart';
import '../../../widgets/customdialog.dart';
import '../Providers/allproviders.dart';

class AddNewsPosts extends StatefulWidget {
  AddNewsPosts({Key? key}) : super(key: key);

  @override
  _AddNewsPostsState createState() => _AddNewsPostsState();
}
class _AddNewsPostsState extends State<AddNewsPosts> {
  TextEditingController locationController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController minPriceController=TextEditingController();
  TextEditingController maxPriceController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  File? imageUrl;
  List imageLink=<String>[];


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
                // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
              )
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
      child: Card(
        elevation: 0,
        child: TextField(
          enabled: controller.text.isNotEmpty?false:true,
          controller: controller,
          autocorrect: true,
          decoration: InputDecoration(
              hintText: Active,
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              disabledBorder:OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
              )
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
    locationController.text=address!;
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
                onPressed: ()async {
                  if(titleController.text.isNotEmpty&&minPriceController.text.isNotEmpty&&maxPriceController.text.isNotEmpty
                  &&phoneNumberController.text.isNotEmpty) {
                    if (formKey.currentState!.validate()) {
                      Customdialog.showDialogBox(context);
                      await uploadImageToFirebase().then((v) {
                        firebaseFirestore.collection("posts").add({
                          "location": locationController.text.trim(),
                          // "Sector":sectorController.text.trim(),
                          // "min":minController.text.trim(),
                          // "max":maxController.text.trim(),
                          "Category": Provider
                              .of<AllpProviders>(context, listen: false)
                              .subcetagory,
                          // "Subcategory":Provider.of<AllpProviders>(context,listen: false).subcetagory,
                          // "cetagories":cetagoryController.text.trim(),
                          // "marqee":marqueeController.text.trim(),
                          "elat": dropdownValueElat,
                          // "storageCapacity":storageCapacityCellController.text.trim(),
                          "title": titleController.text.trim(),
                          "description": descriptionController.text.trim(),
                          "imageLink": imageLink,
                          "minPrice": minPriceController.text.trim(),
                          "maxPrice": maxPriceController.text.trim(),
                          "phoneNumber": phoneNumberController.text.trim(),
                          "address": address,
                          "time": DateTime.now(),
                          "isFav": false
                          ,
                          "userId": firebaseAuth.currentUser!.uid
                        }).whenComplete(() {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Customdialog().showInSnackBar(
                              "Create a new post", context);
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
_titleText('Title'),
                _textFormFieldFunctionIcon(titleController,RequiredValidator(errorText: "required"),'Title'),
                _titleText('Location'),
                  _textFormFieldFunctionIcon(locationController,RequiredValidator(errorText: "required"),'Set Location'),
               
                _titleText('Description'),
                Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: _longDescription(descriptionController,'Product Description')),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child:SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Provider.of<AllpProviders>(context).imageUrls!.length,
                        itemBuilder: (context,index){
                          return Provider.of<AllpProviders>(context).imageUrls?[index].path==null?Container():Image.file(File(Provider.of<AllpProviders>(context).imageUrls?[index].path),height: 100,width: 100,);
                        }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                   InkWell(
                     onTap: (){
                       showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
              
                child:SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('500DHR - 1000DHR '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('1000DHR - 1500DHR '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('1500DHR - 2000DHR '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2000DHR - 2500DHR '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2500DHR - 3000DHR '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('3000DHR - 3500DHR '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('500DHR - 1000DHR '),
                        ),
                        
                      ],
                    
                  ),
                ),
              );
            },
          );
                     },
                     child: Container(
                       height: 50,
                                   // alignment: Alignment.center,
                                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(width: 1, color: Colors.white
                      // )
                      ),
                                   child: Card(
                                     elevation: 1,
                                     margin: EdgeInsets.symmetric(horizontal: 10),
                   
                                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                         padding: const EdgeInsets.only(left:5.0,bottom: 12),
                        child:  _titleText(' Price DX'),
                        ),
                       
                        Padding(
                         padding: const EdgeInsets.only(left:5.0),
                          child:  Text('')
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:5.0),
                          child: Icon(Icons.keyboard_arrow_down_rounded),
                        )
                      ],
                                     ),
                                   ),
                                 ),
                   ),
                 
                 
              
                _titleText(' Phone Number'),
                _textFormFieldFunctionIcon(phoneNumberController,RequiredValidator(errorText: "required"),'Phone Number'),
         _titleText("Types of Ads"),
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
                      ] ),
                ),
               
        ),
      ),
    );
  }
  Future uploadImageToFirebase() async {
    // File? fileName = imageUrl;
    for(XFile image in Provider.of<AllpProviders>(context,listen: false).imageUrls!){
      var uuid = Uuid();
      firebase_storage.Reference firebaseStorageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('cetagories/images+${uuid.v4()}');
      firebase_storage.UploadTask uploadTask =
      firebaseStorageRef.putFile(File(image.path));
      firebase_storage.TaskSnapshot taskSnapshot =
      await uploadTask.whenComplete(() async {
        print(image);
        String img = await uploadTask.snapshot.ref.getDownloadURL();
        setState(() {
          imageLink.add(img);
        });
      });
    }
  }
  Future uploadFile() async {
    int i = 1;

    //   for (var img in _image) {
    //     setState(() {
    //       val = i / _image.length;
    //     });
    //     ref = firebase_storage.FirebaseStorage.instance
    //         .ref()
    //         .child('images/${Path.basename(img.path)}');
    //     await ref.putFile(img).whenComplete(() async {
    //       await ref.getDownloadURL().then((value) {
    //         imgRef.add({'url': value});
    //         i++;
    //       });
    //     });
    //   }
  }

}