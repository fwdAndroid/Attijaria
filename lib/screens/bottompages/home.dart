import 'package:attijaria/screens/Filters/filteration.dart';
import 'package:attijaria/screens/accounments/motoaccouncements.dart';
import 'package:attijaria/screens/productdetails/productdetails.dart';
import 'package:attijaria/widgets/drawer.dart';
import 'package:attijaria/widgets/sliderlist.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String postOrientation = "grid";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    _scrollController
      ..addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          if (isLoading == true) {
            CircularProgressIndicator();
          }
        }
      });

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
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => MotoAnnounce()));
              },
              child: Image.asset('asset/ads.png')),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            color: Colors.black,
            child: TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'asset/adsd.png',
                  height: 18,
                ),
                label: Text(
                  'Annonces premium',
                  style: TextStyle(
                      color: Color(0xff5D55B4),
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                )),
          ),
          Container(
            height: 150,
            color: Colors.black,
            child: SliderList(),
          ),
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
                  icon: Image.asset(
                    'asset/swap.png',
                    height: 20,
                  ),
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
                  icon: Image.asset('asset/filter.png', height: 20),
                ),
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 140,
                            width: 100,
                            child: Image.asset('asset/watch.png'),
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  child: Text('Apple Watch')),
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_pin,
                                  color: Colors.grey,
                                ),
                                label: Text(
                                  'Lahore \n DHA ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.timer,
                                    color: Colors.grey,
                                  ),
                                  label: Text(
                                    '2:30 PM ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Icon(
                                  Icons.favorite_outline_outlined,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
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
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemWidth = (size.height - kToolbarHeight - 69) / 2;
    final double itemHeight = size.width;

    if (isLoading) {
      return CircularProgressIndicator();
    }
    //Oreientation show post as grid or list
    else if (postOrientation == "grid") {
      //Showing Profile Images In GridView Style
      return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Scrollbar(
          thickness: 10,
          showTrackOnHover: true,
          isAlwaysShown: true,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ProductDetail()));
            },
            child: GridView.builder(
                controller: new ScrollController(keepScrollOffset: false),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 174,
                                            width: MediaQuery.of(this.context)
                                                    .size
                                                    .width /
                                                2.4,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                      spreadRadius: 5,
                                                      blurRadius: 5,
                                                      offset: Offset(
                                                          0, 7), // changes
                                                    )
                                                  ]),
                                                  height: 174,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.asset(
                                                        'asset/rectangles.png',
                                                        fit: BoxFit.fitHeight),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 10,
                                                  right: 10,
                                                  child: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
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
                                                      color:
                                                          HexColor('#9098B1'),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Casablanca',
                                                    style: TextStyle(
                                                      color:
                                                          HexColor('#9098B1'),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    Icons.lock_clock,
                                                    size: 14,
                                                    color: HexColor('#9098B1'),
                                                  ),
                                                  Text(
                                                    '14:17',
                                                    style: TextStyle(
                                                      color:
                                                          HexColor('#9098B1'),
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
        ),
      );
    } else if (postOrientation == "list") {
      //Show post as List
      return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Scrollbar(
          thickness: 10,
          showTrackOnHover: true,
          isAlwaysShown: true,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ProductDetail()));
            },
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 140,
                            width: 100,
                            child: Image.asset('asset/watch.png'),
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  child: Text('Apple Watch')),
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_pin,
                                  color: Colors.grey,
                                ),
                                label: Text(
                                  'Lahore \n DHA ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.timer,
                                    color: Colors.grey,
                                  ),
                                  label: Text(
                                    '2:30 PM ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Icon(
                                  Icons.favorite_outline_outlined,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
  }
}
