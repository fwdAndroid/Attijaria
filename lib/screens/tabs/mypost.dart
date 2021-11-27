import 'package:attijaria/widgets/girdviewlist.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyPost extends StatefulWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  MyPostState createState() => MyPostState();
}

class MyPostState extends State<MyPost> {
  late FocusNode myFocusNode = FocusNode();

  ScrollController controller = ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    myFocusNode.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(_scrollListener);
    myFocusNode = FocusNode();
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      setState(() {
        String message = "reach the bottom";
        print(message);
      });
    }
    if (controller.offset <= controller.position.minScrollExtent &&
        !controller.position.outOfRange) {
      setState(() {
        String message = "reach the top";
        print(message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemWidth = (size.height - kToolbarHeight - 100) / 2;
    final double itemHeight = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 13),
              width: 300,
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: TextField(
                focusNode: myFocusNode,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Active (0)',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    controller: new ScrollController(keepScrollOffset: false),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 8,
                        childAspectRatio: itemWidth / itemHeight),
                    itemCount: 6,
                    itemBuilder: (BuildContext ctx, index) {
                      return Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor("#F6F7F8"),
                                  )),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Card(
                                          margin: EdgeInsets.only(left: 10),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 174,
                                                width:
                                                    MediaQuery.of(this.context)
                                                            .size
                                                            .width /
                                                        2.4,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.8),
                                                              spreadRadius: 5,
                                                              blurRadius: 5,
                                                              offset: Offset(0,
                                                                  7), // changes
                                                            )
                                                          ]),
                                                      height: 174,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.asset(
                                                            'asset/rectangles.png',
                                                            fit: BoxFit
                                                                .fitHeight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  '700,90 DH',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Icon(
                                                          Icons.location_pin,
                                                          size: 14,
                                                          color: HexColor(
                                                              '#9098B1'),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Casablanca',
                                                        style: TextStyle(
                                                          color: HexColor(
                                                              '#9098B1'),
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Icon(
                                                        Icons.lock_clock,
                                                        size: 14,
                                                        color:
                                                            HexColor('#9098B1'),
                                                      ),
                                                      Text(
                                                        '14:17',
                                                        style: TextStyle(
                                                          color: HexColor(
                                                              '#9098B1'),
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 8, top: 2, bottom: 8),
                                                child: Text(
                                                  'Livre Mac',
                                                  style: TextStyle(
                                                    color: HexColor('#9098B1'),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
