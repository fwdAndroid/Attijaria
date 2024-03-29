// ignore_for_file: prefer_const_constructors

import 'package:attijaria/Utils/authutils.dart';
import 'package:attijaria/Utils/constant.dart';
import 'package:attijaria/authentication/forgotpassword.dart';
import 'package:attijaria/authentication/register.dart';
import 'package:attijaria/config/config.dart';
import 'package:attijaria/screens/Home/homepage.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailLoginCont = TextEditingController();
  TextEditingController passwordLoginCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: dec,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign into your \nAccount',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        child: _textFormFieldFunction('E-mail', emailLoginCont),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: _textFormFieldFunctionPassword(
                            'Password', passwordLoginCont),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            child: Text(
                              'Forgot your password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: -0.24,
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
                              textAlign: TextAlign.left,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => ForgotPassword()));
                            },
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(343, 50),
                            primary: Colors.white, // background
                            onPrimary: Colors.black, // foreground
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )),
                        onPressed: () async {
                          if(passwordLoginCont.text.isEmpty&&emailLoginCont.text.isEmpty){
                            Customdialog().showInSnackBar("required all Fileds", context);
                          }
                          else if(passwordLoginCont.text.isEmpty){
                            Customdialog().showInSnackBar("requried password", context);
                          }
                          else if(emailLoginCont.text.isEmpty){
                            Customdialog().showInSnackBar("required email", context);
                          }

                          else if(passwordLoginCont.text.isNotEmpty&&emailLoginCont.text.isNotEmpty){
                            Customdialog.showDialogBox(context);
                            AuthUtils().loginUser(emailLoginCont.text.trim(), passwordLoginCont.text.trim(), context);                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'Not a member yet?',
                              // ignore: prefer_const_constructors
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
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => Register()));
                              },
                              // ignore: prefer_const_constructors
                              child: Text(
                                'Register Now',
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
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
                              //   (value) => Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(
                              //       builder: (context) => HomePage(),
                              //     ),
                              //   ),
                              // );
                            await  AuthUtils().signInWithGoogle();
                          await    AuthUtils().socialLoginUser(context);

                            },
                            label: Text(''),
                          ),
                          SizedBox(width: 10,),
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
                            onPressed: ()async {
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _textFormFieldFunction(String s, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Color(0xff9d8f67),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(horizontal: 50),
          fillColor: Colors.white,
          hintText: s,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }

  _textFormFieldFunctionPassword(String s, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color(0xff9d8f67),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            hintText: s,
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }

  signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
