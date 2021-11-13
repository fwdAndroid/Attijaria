import 'package:attijaria/widgets/girdviewlist.dart';
import 'package:flutter/material.dart';

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
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 1,
              child: GridView.builder(
                controller: controller,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 13 / 16,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 30),
                itemCount: 2,
                itemBuilder: (BuildContext ctx, index) {
                  return Stack(
                    children: [
                      GridTile(
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage("asset/comp.png"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        footer: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: GridTileBar(
                            backgroundColor: Colors.white,
                            title: Container(
                              margin: EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                '700 HD',
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Icon(Icons.location_pin, color: Colors.grey),
                                Text(
                                  'Lahore',
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.start,
                                )
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.grey,
                                ),
                                Text('9:30 PM')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
