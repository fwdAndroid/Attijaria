import 'package:attijaria/screens/tabs/favourite.dart';
import 'package:attijaria/screens/tabs/mypost.dart';
import 'package:attijaria/screens/tabs/search.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  //Functions
  Widget listTile(String titleText, String subTitleText, IconData leadingIcon,
      IconData tralingIcon, Function() tap) {
    return Container(
      child: ListTile(
        //  MdiIcons.humanFemale,
        onTap: tap,
        leading: Icon(
          leadingIcon,
          color: Colors.yellow,
        ),
        title: Text(titleText, style: TextStyle(color: Colors.black)),
        subtitle: Text(subTitleText, style: TextStyle(color: Colors.black)),
        trailing: Icon(
          tralingIcon,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Attijjara',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.black,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              width: 400,
              margin: EdgeInsets.only(left: 10, top: 10),
              child:
                  // ignore: prefer_const_constructors
                  ButtonsTabBar(
                contentPadding: EdgeInsets.all(7),
                center: true,
                height: 44,
                radius: 9,
                backgroundColor: Color(0xffF8B800),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    text: "My Post",
                  ),
                  Tab(
                    text: "Favourite",
                  ),
                  Tab(
                    text: "Saved Search",
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.81,
              margin: EdgeInsets.only(top: 11),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        MyPost(),
                        Favourite(),
                        Search(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
