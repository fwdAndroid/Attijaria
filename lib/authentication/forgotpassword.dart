import 'package:attijaria/authentication/codepassword.dart';
import 'package:attijaria/authentication/login.dart';
import 'package:attijaria/config/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: dec,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Define a new password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'You will receive a verification code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:
                    _textFormFieldFunction('Your email or Phone', controller),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => VerificationCode()));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(343, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.white),
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _textFormFieldFunction(String s, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        color: Color(0xff9d8f67),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(horizontal: 50),
          fillColor: Colors.blueAccent,
          hintText: s,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
