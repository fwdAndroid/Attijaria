import 'package:attijaria/screens/introscreens/onboard.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xffDFA600),
            image: DecorationImage(
                image: AssetImage('asset/overlay.png'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(child: OnBoardingScreens()),
            ],
          ),
        ),
      ),
    );
  }
}
