import 'package:attijaria/screens/createpost/ads/addrealstatepost.dart';
import 'package:attijaria/screens/createpost/ads/addshoppremoses.dart';
import 'package:attijaria/screens/createpost/ads/addvechiclePost.dart';
import 'package:attijaria/screens/createpost/ads/housesandvilasads.dart';
import 'package:attijaria/screens/createpost/ads/officetraysadds.dart';
import 'package:attijaria/screens/createpost/ads/publicationlandsandformsads.dart';
import 'package:flutter/material.dart';

class AdsCategory extends StatefulWidget {
  const AdsCategory({Key? key}) : super(key: key);

  @override
  _AdsCategoryState createState() => _AdsCategoryState();
}

class _AdsCategoryState extends State<AdsCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Choose Category To Post Add'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Container(
                          height: 150,
                          width: 150,
                          child: Image.asset(
                            'asset/vehicle.png',
                            fit: BoxFit.fill,
                          )),
                      MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 5.0,
                          color: Color(0xFF801E48),
                          child: new Text(
                            'Vehicles',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => CreatePost()));
                          }),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                'asset/realstate.png',
                                fit: BoxFit.fill,
                              )),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              color: Color(0xFF801E48),
                              child: new Text(
                                'Real State',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => RealStatePost()));
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                'asset/shops.png',
                                fit: BoxFit.fill,
                              )),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              color: Color(0xFF801E48),
                              child: new Text(
                                'Store & Shops',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            StoreshopPremisesPost()));
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                'asset/house.png',
                                fit: BoxFit.fill,
                              )),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              color: Color(0xFF801E48),
                              child: new Text(
                                'Houses & Villas',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => HousesAndVilas()));
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                'asset/office.png',
                                fit: BoxFit.fill,
                              )),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              color: Color(0xFF801E48),
                              child: new Text(
                                'Offices',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            OfficesAndTraysAds()));
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                'asset/land.png',
                                fit: BoxFit.fill,
                              )),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              color: Color(0xFF801E48),
                              child: new Text(
                                'Publication Lands',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            PublicationLandAndFormAds()));
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
