import 'package:attijaria/screens/Filters/agriculturefilters.dart';
import 'package:attijaria/screens/Filters/filtersappartments.dart';
import 'package:attijaria/screens/Filters/holidayfilters.dart';
import 'package:attijaria/screens/Filters/motofilters.dart';
import 'package:attijaria/screens/Filters/officesandtrayfilters.dart';
import 'package:attijaria/screens/Filters/rental.dart';
import 'package:attijaria/screens/Filters/storeshoppremisespostfilter.dart';
import 'package:attijaria/screens/Filters/telephone.dart';
import 'package:attijaria/screens/Filters/vehiclefilters.dart';
import 'package:flutter/material.dart';

class Filteration extends StatefulWidget {
  const Filteration({Key? key}) : super(key: key);

  @override
  _FilterationState createState() => _FilterationState();
}

class _FilterationState extends State<Filteration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Filters',
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
                        builder: (BuildContext context) => HolidaysFilters()));
              },
              child: ListTile(
                title: Text(
                  "Holidays",
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
                            AppartmentsFilters()));
              },
              child: ListTile(
                title: Text(
                  "Appartments",
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
                        builder: (BuildContext context) => VehicleFilters()));
              },
              child: ListTile(
                title: Text(
                  "Vehicles",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => MotoFilters()));
              },
              child: ListTile(
                title: Text(
                  "Moto",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfficesAndTraysAdsFilters()));
              },
              child: ListTile(
                title: Text(
                  "Offices And Trays",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            LandandFarmsFilters()));
              },
              child: ListTile(
                title: Text(
                  "Lands And Farms",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            StoreshopPremisesPostFilters()));
              },
              child: ListTile(
                title: Text(
                  "Shops",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => Telephone()));
              },
              child: ListTile(
                title: Text(
                  "Telephones",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AgricultureFilters()));
              },
              child: ListTile(
                title: Text(
                  "Agriculture",
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
