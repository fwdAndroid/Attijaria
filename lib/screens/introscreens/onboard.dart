import 'package:attijaria/authentication/login.dart';
import 'package:attijaria/authentication/register.dart';
import 'package:attijaria/screens/introscreens/screensone.dart';
import 'package:attijaria/screens/introscreens/screensthree.dart';
import 'package:attijaria/screens/introscreens/screenstwo.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingScreens extends StatefulWidget {
  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

int currentPage = 0;

final _controller = PageController(initialPage: 0);
List<Widget> _pages = [
  Column(children: [Expanded(child: OnboardingScreenOne())]),
  Column(children: [Expanded(child: OnboardingScreenTwo())]),
  Column(children: [Expanded(child: OnboardingScreenThree())]),
];

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _pages.length,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            color: Colors.black87, // Inactive color
            activeColor: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => Login()));
                },
                focusColor: Colors.white,
                highlightColor: Colors.red,
                child: Image.asset(
                  'asset/lg.png',
                  height: 64,
                  width: 164,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => Register()));
                },
                focusColor: Colors.white,
                highlightColor: Colors.red,
                child: Image.asset(
                  'asset/ref.png',
                  height: 64,
                  width: 164,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
