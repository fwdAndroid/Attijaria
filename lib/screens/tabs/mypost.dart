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
              margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 1,
              child: GridView.builder(
                controller: controller,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 15),
                itemCount: 2,
                itemBuilder: (BuildContext ctx, index) {
                  return Stack(
                    children: [
                      GridTile(
                        child: Image.asset(
                          'asset/comp.png',
                        ),
                        footer: GridTileBar(
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
