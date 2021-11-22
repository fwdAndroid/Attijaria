import 'package:attijaria/screens/Filters/filteration.dart';
import 'package:attijaria/screens/accounments/motoaccouncements.dart';
import 'package:attijaria/widgets/drawer.dart';
import 'package:attijaria/widgets/girdviewlist.dart';
import 'package:attijaria/widgets/listviewgrid.dart';
import 'package:attijaria/widgets/sliderlist.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  String postOrientation = "grid";

  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    _controller.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var listWidget = [
      GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => MotoAnnounce()));
          },
          child: Image.asset('asset/ads.png')),
      Container(
        height: 200,
        color: Colors.black,
        child: SliderList(),
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: IconButton(
                    onPressed: () => setPostOrientation("grid"),
                    icon: Image.asset('asset/frame.png'),
                  ),
                ),
                Card(
                  child: TextButton.icon(
                    label: Text(
                      'Tier',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () => setPostOrientation("list"),
                    icon: Image.asset('asset/swap.png'),
                  ),
                ),
                Card(
                  child: TextButton.icon(
                    label: Text(
                      'Filters',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => Filteration())),
                    icon: Image.asset('asset/swap.png'),
                  ),
                ),
              ],
            ),

            Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: buildProfilePost(),
              ),
            ),

            // Container(
            //     margin: EdgeInsets.only(top: 20),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(10.0),
            //           bottomRight: Radius.circular(10.0)),
            //       color: Colors.white,
            //     ),
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height,
            //     child: Orientatiosn()),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (xtc) => MotoAnnounce()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'asset/long.png',
                ),
              ),
            ),
            ListViewGrid(
              controller: _controller,
            ),
            Gridviewlist(
              controller: _controller,
            ),
          ],
        ),
      )
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Attijjara',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return listWidget[index];
              },
              itemCount: listWidget.length);
        }));
  }

  //Setting Orientation of post
  setPostOrientation(String postOrientation) {
    setState(() {
      this.postOrientation = postOrientation;
    });
  }

  buildProfilePost() {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    //Oreientation show post as grid or list
    else if (postOrientation == "grid") {
      //Showing Profile Images In GridView Style
      return Gridviewlist(
        controller: _controller,
      );
    } else if (postOrientation == "list") {
      //Show post as List
      return ListViewGrid(
        controller: _controller,
      );
    }
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        String message = "reach the bottom";
        print(message);
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        String message = "reach the top";
        print(message);
      });
    }
  }
}
