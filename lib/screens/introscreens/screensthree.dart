import 'package:attijaria/authentication/login.dart';
import 'package:attijaria/screens/Home/homepage.dart';
import 'package:attijaria/screens/introscreens/constants/constants.dart';
import 'package:attijaria/screens/introscreens/screenstwo.dart';
import 'package:flutter/material.dart';

class OnboardingScreenThree extends StatefulWidget {
  @override
  State<OnboardingScreenThree> createState() => _OnboardingScreenThreeState();
}

class _OnboardingScreenThreeState extends State<OnboardingScreenThree> {
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
                      'asset/hand.png',
                    ),
                  ),
                  Text(
                    'Benefits 3/3',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'You can be a buyer or a seller',
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
                'It is up to you to buy the product or sell it.\n On the attijaria app you can do both',
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
