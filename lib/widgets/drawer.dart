import 'package:attijaria/screens/Information/information.dart';
import 'package:attijaria/screens/accounts/choselanguage/chooselanguage.dart';
import 'package:attijaria/screens/bottompages/tosell.dart';
import 'package:attijaria/screens/config/config.dart';
import 'package:attijaria/screens/createpost/ads/addrealstatepost.dart';
import 'package:attijaria/screens/createpost/ads/addvechiclePost.dart';
import 'package:attijaria/screens/createpost/ads/publicationlandsandformsads.dart';
import 'package:attijaria/screens/profilesection/profilesection.dart';
import 'package:attijaria/screens/tabs/favourite.dart';
import 'package:attijaria/screens/tabs/search.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //Functions
  Widget listTile({required String title, required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
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
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 1,
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
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                      child: Text('Create a post'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffF8B800),
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => PublicationLandAndFormAds()));
                      },
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 14, top: 6),
                      child: listTile(
                          title: "Profile",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (Ctx) => ProfileSection()));
                          })),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: listTile(
                        title: "Chat",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => ToSell(),
                            ),
                          );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: listTile(
                      title: "Favourite",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (Ctx) => Favourite()));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: listTile(
                      title: "Search",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (Ctx) => Search()));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 14,
                    ),
                    child: listTile(
                        title: "Language",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (xtx) => ChooseLanguage()));
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: listTile(title: "Contact Us", onTap: () {}),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 14,
                    ),
                    child: listTile(
                      title: "Information",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (Ctx) => Information()));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    child: listTile(title: "DarkMode", onTap: () {}),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.black),
            Container(
              margin: EdgeInsets.only(left: 14),
              child: ListTile(
                leading: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                trailing: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
