import 'dart:async';

import 'package:attijaria/authentication/setpassword.dart';
import 'package:attijaria/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  StreamController<ErrorAnimationType>? errorController;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    String currentText = "";

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          // ignore: prefer_const_constructors
          decoration: dec,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                // ignore: prefer_const_constructors
                child: Text('Check The Code',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: const EdgeInsets.only(top: 55),
                // ignore: prefer_const_constructors
                child: Text('Enter The Code That\n You Have Recieved',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 58),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: false,
                  obscuringCharacter: '*',
                  //  blinkWhenObscuring: true,
                  //       animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    inactiveColor: Colors.white,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    activeFillColor: Colors.white,
                  ),
                  // cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  //  enableActiveFill: true,
                  //   errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  // boxShadows: [
                  //   BoxShadow(
                  //     offset: Offset(0, 1),
                  //     color: Colors.black12,
                  //     blurRadius: 10,
                  //   )
                  // ],
                  onCompleted: (v) {
                    print("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
              Container(
                  width: 300,
                  height: 60,
                  margin: EdgeInsets.only(top: 17),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (tx) => SetPassword()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.white),
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
