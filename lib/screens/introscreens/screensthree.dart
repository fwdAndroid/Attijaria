import 'package:attijaria/authentication/login.dart';
import 'package:attijaria/screens/introscreens/constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class OnboardingScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //it will helps to return the size of the screen
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
            color: Color(0xffDFA600),
            image: DecorationImage(
                image: AssetImage('asset/overlay.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Atijarria',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                  ),
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
                Image(
                  width: size.width,
                  //  height: size.height * 0.5,
                  fit: BoxFit.cover,
                  image: AssetImage('asset/saly.png'),
                ),
              ],
            ),
            Positioned(
              top: size.height * 0.80,
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(appPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'You can be a buyer or seller',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'It is up to you to buy the product or sell it \n On the attijaria app you can do both',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Login(),
                          ),
                        );
                      },
                      backgroundColor: white,
                      child: Icon(
                        Icons.navigate_next_rounded,
                        color: black,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
