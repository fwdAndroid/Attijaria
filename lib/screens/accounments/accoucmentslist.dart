import 'package:attijaria/screens/accounments/agricultureannouncement.dart';
import 'package:attijaria/screens/accounments/houseanousncment.dart';
import 'package:attijaria/screens/accounments/landaccouncements.dart';
import 'package:attijaria/screens/accounments/motoaccouncements.dart';
import 'package:attijaria/screens/accounments/phoneaccouncments.dart';
import 'package:attijaria/screens/accounments/vehicleannouncement.dart';
import 'package:attijaria/screens/accounments/vilaaccouncement.dart';
import 'package:flutter/material.dart';

class AccouncmentsList extends StatefulWidget {
  const AccouncmentsList({Key? key}) : super(key: key);

  @override
  _AccouncmentsListState createState() => _AccouncmentsListState();
}

class _AccouncmentsListState extends State<AccouncmentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Accouncments',
          style: TextStyle(color: Colors.black),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,

            // ignore: deprecated_member_use

            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => MotoAnnounce()));
              },
              child: ListTile(
                title: Text(
                  "Moto Announcement",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,

            // ignore: deprecated_member_use

            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PhoneAnnouncement()));
              },
              child: ListTile(
                title: Text(
                  "Phone Announcement",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,

            // ignore: deprecated_member_use

            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AgricultureAnnouncement()));
              },
              child: ListTile(
                title: Text(
                  "Agriculture Announcement",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,

            // ignore: deprecated_member_use

            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            VehicleAnnouncement()));
              },
              child: ListTile(
                title: Text(
                  "Vehicle Announcement",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,

            // ignore: deprecated_member_use

            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            VilaAnnouncement()));
              },
              child: ListTile(
                title: Text(
                  "Vila Announcement",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,

            // ignore: deprecated_member_use

            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            LandAccouncements()));
              },
              child: ListTile(
                title: Text(
                  "Land Announcement",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
           Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,

            // ignore: deprecated_member_use

            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HouseAnnouncement()));
              },
              child: ListTile(
                title: Text(
                  "House Announcement",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
