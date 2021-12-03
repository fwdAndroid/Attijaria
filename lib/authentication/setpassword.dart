import 'package:attijaria/authentication/forgotpassword.dart';
import 'package:attijaria/authentication/register.dart';
import 'package:attijaria/config/config.dart';
import 'package:flutter/material.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: dec,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Define a new',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              _textFormFieldFunction('New Password'),
              _textFormFieldFunction('Confrim Password'),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (tx) => SetPassword()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(345, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: Colors.white),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _textFormFieldFunction(String s) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Color(0xff9d8f67),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
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

  _textFormFieldFunctionPassword(String s) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('asset/background.png')),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
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
}
