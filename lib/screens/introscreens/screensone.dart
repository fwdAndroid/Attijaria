import 'package:attijaria/screens/introscreens/constants/constants.dart';
import 'package:attijaria/screens/introscreens/screenstwo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class OnboardingScreenOne extends StatelessWidget {
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
                  image: AssetImage('asset/pic.png'),
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
                      'Take a picture of your product',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Make clear images of the item you \n want to sell on the attijaria.',
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
                            builder: (_) => OnboardingScreenTwo(),
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