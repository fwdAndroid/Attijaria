// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:attijaria/Utils/authutils.dart';
import 'package:attijaria/authentication/login.dart';
import 'package:attijaria/config/config.dart';
import 'package:attijaria/screens/Home/homepage.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Male';
    // List of items in our dropdown menu
    var items = [
      'Male',
      'Female',
      'Not Specified',
    ];

    var appSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: appSize.height,
            width: appSize.width,
            child: Form(
              key: formKey,
              child: Container(
                decoration: dec,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create new account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            //adding Profile Pic
                            InkWell(
                              onTap: addImage,
                              child:imageUrl==null? CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage("asset/profilepic.png"),
                              ):CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(imageUrl!),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: _textFormFieldFunction(
                                'Name',
                                nameController,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: _textFormFieldFunction(
                                'Phone Number',
                                phoneController,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: _textFormFieldFunction(
                                'DOB',
                                dobController,
                              ),
                            ),
                            Container(
                              width: 320,
                              height: 48,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin:
                                  EdgeInsets.only(top: 10, left: 20, right: 20),
                              decoration: BoxDecoration(
                                color: Color(0xff9d8f67),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // margin: EdgeInsets.symmetric(horizontal:20, vertical: 12),
                              child: Theme(
                                data: ThemeData(accentColor: Colors.white,
                                primaryColor: Colors.white,
                                  canvasColor: Colors.white
                                ),
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: DropdownButtonHideUnderline(
                                      child: Container()),

                                  // Initial Value
                                  value: dropdownvalue,

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  //   hint: Text("Select Genders",style: TextStyle(color: Colors.white),),
                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                    print(dropdownvalue);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child:
                              _textFormFieldFunction('E-mail', emailController),
),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: _textFormFieldFunctionPassword(
                                  'Password', passController),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if(phoneController.text.isEmpty&&dobController.text.isEmpty&&nameController.text.isEmpty&&passController.text.isEmpty&&emailController.text.isEmpty){
                                    Customdialog().showInSnackBar("required all Fileds", context);
                                  }
                                  else if(nameController.text.isEmpty){
                                    Customdialog().showInSnackBar("required name", context);
                                  }

                                  else if(phoneController.text.isEmpty) {
                                    Customdialog().showInSnackBar(
                                        "required Phone Number", context);
                                  }
                                  else if(dobController.text.isEmpty) {
                                    Customdialog().showInSnackBar(
                                        "required DOB", context);
                                  }
                                  else if(emailController.text.isEmpty){
                                    Customdialog().showInSnackBar("required email", context);
                                  }
                                  else if(passController.text.isEmpty) {
                                    Customdialog().showInSnackBar(
                                        "required password", context);
                                  }
                                 else if (phoneController.text.isEmpty &&
                                      dobController.text.isEmpty &&
                                      nameController.text.isEmpty &&
                                      passController.text.isEmpty &&
                                      emailController.text.isEmpty) {
                                    Customdialog().showInSnackBar(
                                        "required all Fileds", context);
                                  } else if (nameController.text.isEmpty) {
                                    Customdialog().showInSnackBar(
                                        "required name", context);
                                  } else if (phoneController.text.isEmpty) {
                                    Customdialog().showInSnackBar(
                                        "required Phone Number", context);
                                  } else if (dobController.text.isEmpty) {
                                    Customdialog().showInSnackBar(
                                        "required DOB", context);
                                  } else if (emailController.text.isEmpty) {
                                    Customdialog().showInSnackBar(
                                        "required email", context);
                                  } else if (passController.text.isEmpty) {
                                    Customdialog().showInSnackBar(
                                        "required password", context);
                                  }
                                  else if(imageUrl==null){
                                    Customdialog().showInSnackBar(
                                        "Please add Image", context);

                                  }
                                  else if (nameController.text.isNotEmpty &&
                                      passController.text.isNotEmpty &&
                                      emailController.text.isNotEmpty&&imageUrl!=null) {
                                    Customdialog.showDialogBox(context);
                                    uploadImageToFirebase().whenComplete(() {
                                      AuthUtils().registerUser(
                                          nameController.text.trim(),
                                          emailController.text.trim(),
                                          passController.text.trim(),
                                          dobController.text.trim(),
                                          dropdownvalue.trim(),
                                          phoneController.text.trim(),
                                          imageLink!,
                                          context);
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(310, 50),
                                    primary: Colors.white, // background
                                    onPrimary: Colors.black, // foreground
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    )),
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already Have an Account?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      letterSpacing: -0.24,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0xff000000),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => Login()));
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: -0.24,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0xff000000),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
 ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),

                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Or Connect With',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: -0.24,
                                // ignore: prefer_const_literals_to_create_immutables
                                shadows: [
                                  BoxShadow(
                                    color: Color(0xff000000),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff50442c), // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                icon: Image.asset(
                                  'asset/google.png',
                                  height: 50,
                                  width: 120,
                                ),
                                onPressed: () async {
                                  // await googleSignUp(context).then(
                                  //       (value) =>
                                  //       Navigator.of(context).pushReplacement(
                                  //         MaterialPageRoute(
                                  //           builder: (context) => HomePage(),
                                  //         ),
                                  //       ),
                                  // );
                                  try {
                                    await AuthUtils().signInWithGoogle();
                                    await AuthUtils().socialLoginUser(context);
                                  }catch(e){
    Customdialog.showBox(context, e.toString());
    }
                                },
                                label: Text(''),
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff50442c), // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                icon: Image.asset(
                                  'asset/face.png',
                                  height: 50,
                                  width: 120,
                                ),
                                onPressed: () async{
                                  try{
                                    await  AuthUtils().facbookLogin();
                                    await    AuthUtils().socialLoginUser(context);
                                  }catch(e){
                                    Customdialog.showBox(context, e.toString());
                                  }
                                },
                                label: Text(''),
                              ),
                            ]),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _textFormFieldFunction(String s, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Color(0xff9d8f67),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          fillColor: Colors.blueAccent,
          hintText: s,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }

  _textFormFieldFunctionPassword(String s, TextEditingController passContor) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Color(0xff9d8f67),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: passContor,
        obscureText: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            hintText: s,
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }

  createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  googleSignUp(BuildContext context) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;

      print("signed in " + user!.email.toString());

      return user;
      // ignore: empty_catches
    } catch (e) {}
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
