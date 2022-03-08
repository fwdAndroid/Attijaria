import 'package:attijaria/Utils/constant.dart';
import 'package:attijaria/screens/accounts/ChangeEmail/changeemail.dart';
import 'package:attijaria/screens/accounts/ChangePassword/changepassword.dart';
import 'package:attijaria/screens/accounts/ChangePhone/changephone.dart';
import 'package:attijaria/screens/accounts/DOB/dob.dart';
import 'package:attijaria/screens/accounts/Gender/selectgender.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder(
          stream: firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).snapshots(),
          builder: (context,AsyncSnapshot snapshot){
        if(snapshot.hasError){
          return Text("Error Accured");
        }
        else if(snapshot.data==null){
          return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasData){
          return ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Row(
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
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data['imageLink'],
                        imageBuilder: (context,
                            imageProvider) =>
                            Container(
                              decoration:
                              BoxDecoration(
                                shape:
                                BoxShape.circle,
                                image:
                                DecorationImage(
                                  image:
                                  imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                        placeholder: (context,
                            url) =>
                            Center(
                                child: Image.asset(
                                    "asset/infinity.gif")),
                        errorWidget: (context,
                            url, error) =>
                            Center(
                                child: Icon(
                                    Icons.error)),
                      )),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
            snapshot.data['UserName']??"",
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
                height: MediaQuery.of(context).size.height * 0.7,
                margin: EdgeInsets.only(top: 1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      focusColor: Colors.yellow,
                      hoverColor: Colors.black,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: listTile(
                            'Gender',
                            snapshot.data['Gender']??"",
                            MdiIcons.genderMaleFemale,
                            Icons.arrow_forward_ios, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => SelectGender()));
                        }),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: listTile('DOB',             snapshot.data['DOB']??"",
                            Icons.calendar_today, Icons.arrow_forward_ios, () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) => DOB()));
                            }),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: listTile('Email',             snapshot.data['Email']??"", Icons.email,
                            Icons.arrow_forward_ios, () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) => ChangeEmail()));
                            }),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: listTile('Phone Number',             snapshot.data['Phone Number']??"",
                            Icons.mobile_friendly, Icons.arrow_forward_ios, () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) => ChangePhone()));
                            }),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: listTile('Change Password', '********',
                            Icons.password_outlined, Icons.arrow_forward_ios, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ChangePassword(
                                      )));
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
          return CircularProgressIndicator();
        },),
      ),
    );
  }
}
