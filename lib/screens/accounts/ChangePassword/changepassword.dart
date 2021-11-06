import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                'Change Password',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              width: 320,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Enter Old Password',
                  suffixIcon: Icon(
                    Icons.lock,
                    color: Colors.yellow,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.yellow, width: 2),
                  ),
                ),
              ),
            ),
            Container(
              width: 320,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Enter New Password',
                  suffixIcon: Icon(
                    Icons.lock,
                    color: Colors.yellow,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.yellow, width: 2),
                  ),
                ),
              ),
            ),
            Container(
              width: 320,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Retype New Password',
                  suffixIcon: Icon(
                    Icons.lock,
                    color: Colors.yellow,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.yellow, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.yellow, width: 2),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 60,
              width: 260,
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF8B800),
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                ),
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
