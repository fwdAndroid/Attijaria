// ignore_for_file: prefer_const_constructors

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

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Male';
    // List of items in our dropdown menu
    var items = [
      'Male',
      'Female',
      'Not Specified',
    ];
<<<<<<< HEAD
    var appSize=MediaQuery.of(context).size;
=======
    var appSize = MediaQuery.of(context).size;
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
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
<<<<<<< HEAD
                              padding: EdgeInsets.only(left:20),
                              width: 320,
                              height: 48,
=======
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin:
                                  EdgeInsets.only(top: 10, left: 20, right: 20),
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
                              decoration: BoxDecoration(
                                color: Color(0xff9d8f67),
                                borderRadius: BorderRadius.circular(10),
                              ),
<<<<<<< HEAD
                              margin: EdgeInsets.symmetric(horizontal:20, vertical: 12),
                              child:  DropdownButton(
                                isExpanded: true,
=======
                              child: DropdownButton(
                                isExpanded: true,
                                underline: DropdownButtonHideUnderline(
                                    child: Container()),
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5

                                // Initial Value
                                value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),
<<<<<<< HEAD

=======
                                //   hint: Text("Select Genders",style: TextStyle(color: Colors.white),),
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
<<<<<<< HEAD
                                    child: Text(items,style: TextStyle(
                                      color: Colors.black,),),
=======
                                    child: Text(
                                      items,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
<<<<<<< HEAD
                                onChanged: ( newValue) {
                                  setState(() {
                                    dropdownvalue = newValue.toString();
                                  });
print(dropdownvalue);
=======
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownvalue = newValue.toString();
                                  });
                                  print(dropdownvalue);
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
<<<<<<< HEAD
                              child:
                              _textFormFieldFunction('E-mail', emailController),
=======
                              child: _textFormFieldFunction(
                                  'E-mail', emailController),
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
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
<<<<<<< HEAD
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
                                  else if(nameController.text.isNotEmpty&&passController.text.isNotEmpty&&emailController.text.isNotEmpty){
                                    Customdialog.showDialogBox(context);
                                    AuthUtils().registerUser(nameController.text.trim(), emailController.text.trim(),
                                        passController.text.trim(), dobController.text.trim(),
=======
                                  if (phoneController.text.isEmpty &&
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
                                  } else if (nameController.text.isNotEmpty &&
                                      passController.text.isNotEmpty &&
                                      emailController.text.isNotEmpty) {
                                    Customdialog.showDialogBox(context);
                                    AuthUtils().registerUser(
                                        nameController.text.trim(),
                                        emailController.text.trim(),
                                        passController.text.trim(),
                                        dobController.text.trim(),
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
                                        dropdownvalue.trim(),
                                        phoneController.text.trim(),
                                        context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(343, 50),
                                    primary: Colors.white, // background
                                    onPrimary: Colors.black, // foreground
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    )),
                                child: Text(
                                  "Create Account",
<<<<<<< HEAD
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 18),
=======
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
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
<<<<<<< HEAD
                                          offset: Offset(
                                              0, 3), // changes position of shadow
=======
                                          offset: Offset(0,
                                              3), // changes position of shadow
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
<<<<<<< HEAD
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (ctx) => Login()));
=======
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => Login()));
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
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
<<<<<<< HEAD
                                            offset: Offset(
                                                0, 3), // changes position of shadow
=======
                                            offset: Offset(0,
                                                3), // changes position of shadow
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
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
<<<<<<< HEAD
                      margin: EdgeInsets.only(bottom: 20),
=======
                      margin: EdgeInsets.only(bottom: 30),
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
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
<<<<<<< HEAD
                                    offset:
                                    Offset(0, 3), // changes position of shadow
=======
                                    offset: Offset(
                                        0, 3), // changes position of shadow
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
                                  ),
                                ],
                              ),
                            ),
                          ),
<<<<<<< HEAD
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
                            ],
=======
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
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
                                      await AuthUtils()
                                          .socialLoginUser(context);
                                    } catch (e) {
                                      Customdialog.showBox(
                                          context, e.toString());
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
                                  onPressed: () async {
                                    try {
                                      await AuthUtils().facbookLogin();
                                      await AuthUtils()
                                          .socialLoginUser(context);
                                    } catch (e) {
                                      Customdialog.showBox(
                                          context, e.toString());
                                    }
                                  },
                                  label: Text(''),
                                ),
                              ],
                            ),
>>>>>>> 06c64b5b830d736b9911a42878aeed48329cb7c5
                          ),
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
}
