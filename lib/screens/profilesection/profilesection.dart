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
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Attijjara',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          bottom: ButtonsTabBar(
            physics: NeverScrollableScrollPhysics(),
            backgroundColor: Color(0xffF8B800),
            unselectedBackgroundColor: Colors.grey[300],
            unselectedLabelStyle: TextStyle(color: Colors.black),
            labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: 'Post',
              ),
              Tab(
                text: 'Favourite',
              ),
              Tab(
                text: 'Deactivate',
              ),
            ],
          ),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: TabBarView(
          children: [MyPost(), Favourite(), Search()],
        ),
      ),
    );
  }
}
