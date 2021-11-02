import 'package:attijaria/screens/Information/information.dart';
import 'package:attijaria/screens/config/config.dart';
import 'package:attijaria/screens/profiles/profilescreen.dart';
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
      required IconData icontraling,
      required String titleText,
      required IconData icon}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Row(
        children: [Text(titleText), Icon(icontraling)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Expanded(
                child: listTile(
                    icon: Icons.phone,
                    title: "Phone Number",
                    titleText: '+92304953212',
                    icontraling: Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
