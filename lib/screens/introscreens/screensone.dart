import 'package:attijaria/authentication/login.dart';
import 'package:attijaria/screens/Home/homepage.dart';
import 'package:attijaria/screens/introscreens/constants/constants.dart';
import 'package:attijaria/screens/introscreens/screenstwo.dart';
import 'package:flutter/material.dart';

class OnboardingScreenOne extends StatefulWidget {
  @override
  State<OnboardingScreenOne> createState() => _OnboardingScreenOneState();
}

class _OnboardingScreenOneState extends State<OnboardingScreenOne> {
  @override
  Widget build(BuildContext context) {
    //it will helps to return the size of the screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              color: Color(0xffDFA600),
              image: DecorationImage(
                  image: AssetImage('asset/overlay.png'), fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Atijarria',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              Text(
                'The right way to sell your product easily',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  Image(
                    width: size.width,
                    height: 429,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'asset/pic.png',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Benefits 1/3',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Text(
                'Take a picture of your product',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'Make clear images of the item you \n want to sell on the attijaria.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )),
    );
  }
}
