import 'package:attijaria/screens/config/config.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
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
                margin: EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    )),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 14, top: 20),
                        child: listTile(title: "About", onTap: () {})),
                    Container(
                      margin: EdgeInsets.only(left: 14),
                      child: listTile(
                          title: "Rate the application",
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (ctx) => ReviewCart(),
                            //   ),
                            // );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 14),
                      child: listTile(
                        title: "Publication rules",
                        onTap: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 14),
                      child: listTile(
                        title: "Terms of use",
                        onTap: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 14,
                      ),
                      child: listTile(title: "Private data", onTap: () {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
