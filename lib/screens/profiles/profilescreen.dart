import 'package:attijaria/screens/config/config.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Functions
  Widget listTile(
      {required String title,
      required Function() onTap,
      required IconData icon,
      required IconData icontraling,
      required String titleText}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Color(0xffF8B800),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      trailing: Row(children: [
        Text(titleText),
        Icon(icontraling),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 43,
                  // ignore: prefer_const_constructors
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('asset/profilepic.png'),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  ' Qasim',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 25,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      side: const BorderSide(width: 2),
                    ),
                    // ignore: prefer_const_constructors
                    onPressed: () {}, child: Text('Memeber Since 2021'),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  )),
              child: ListView(
                children: [
                  listTile(
                      icon: Icons.male,
                      title: "Gender",
                      onTap: () {},
                      titleText: 'Male',
                      icontraling: Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
