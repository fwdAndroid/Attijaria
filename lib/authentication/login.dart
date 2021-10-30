import 'package:attijaria/authentication/forgotpassword.dart';
import 'package:attijaria/authentication/register.dart';
import 'package:attijaria/config/config.dart';
import 'package:attijaria/screens/Home/homepage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                'Sign into your Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              _textFormFieldFunction('E-mail'),
              _textFormFieldFunctionPassword('Password'),
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
                            offset: Offset(0, 3), // changes position of shadow
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
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => HomePage()));
                  },
                  child: Image.asset('asset/button.png')),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member yet?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: -0.24,
                        shadows: [
                          BoxShadow(
                            color: Color(0xff000000),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => Register()));
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          letterSpacing: -0.24,
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
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Or Connect With',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: -0.24,
                  shadows: [
                    BoxShadow(
                      color: Color(0xff000000),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset('asset/facebook.png')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _textFormFieldFunction(String s) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('asset/background.png')),
        borderRadius: BorderRadius.circular(20),
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
