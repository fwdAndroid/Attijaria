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
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Text(
                'Save your favourite search',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Image(
                width: size.width,
                fit: BoxFit.cover,
                image: AssetImage(
                  'asset/hands.png',
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ElevatedButton(
                child: Text('Sell your product'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(343, 57),
                  primary: Color.fromRGBO(248, 184, 0, 1),
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
