import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: ListTile(
          title: Center(
            child: Text(
              'Attijjara',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Voiluter()),
              // );
            },
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
          ),
          trailing: Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: 100,
                          child: Card(
                            margin:
                                EdgeInsets.only(top: 25, left: 10, right: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              child: ListTile(
                                leading: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Marouene kh',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '6 min',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ]),
                                title: Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Save Your Post',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                trailing: Image.network(
                                    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2Fyc3xlbnwwfHwwfHw%3D&w=1000&q=80'),
                              ),
                            ),
                          ));
                    }),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
