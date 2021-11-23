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
    bool isLoading = false;
    String postOrientation = "grid";
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
      body: ListView(
        controller: _controller,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              MotoAnnounce()));
                                },
                                child: Image.asset('asset/ads.png')),
                            Container(
                              height: 150,
                              color: Colors.black,
                              child: SliderList(),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
                                      child: IconButton(
                                        onPressed: () =>
                                            setPostOrientation("grid"),
                                        icon: Image.asset('asset/frame.png'),
                                      ),
                                    ),
                                    Card(
                                      child: TextButton.icon(
                                        label: Text(
                                          'Tier',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        onPressed: () =>
                                            setPostOrientation("list"),
                                        icon: Image.asset('asset/swap.png'),
                                      ),
                                    ),
                                    Card(
                                      child: TextButton.icon(
                                        label: Text(
                                          'Filters',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    Filteration())),
                                        icon: Image.asset('asset/swap.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            buildProfilePost(),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 0),
                              child: Image.asset(
                                'asset/long.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
