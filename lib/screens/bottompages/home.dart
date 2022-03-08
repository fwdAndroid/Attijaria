import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:attijaria/Utils/constant.dart';
import 'package:attijaria/screens/Filters/filteration.dart';
import 'package:attijaria/screens/accounments/motoaccouncements.dart';
import 'package:attijaria/screens/productdetails/productdetails.dart';
import 'package:attijaria/widgets/drawer.dart';
import 'package:attijaria/widgets/sliderlist.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String postOrientation = "grid";
  bool isLoading = false;
  String searchText = "";

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


          actions: [Container(

              padding: const EdgeInsets.only(right: 10),
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder) => Filteration()));
              }, icon: Icon(Icons.search,color: Colors.white), )
            //    AnimatedSearchBar(

            //   labelStyle: TextStyle(fontSize: 16),
            //   searchStyle: TextStyle(color: Colors.white),
            //   cursorColor: Colors.white,
            //   searchDecoration: InputDecoration(
            //     hintText: "Search",
            //     alignLabelWithHint: true,
            //     fillColor: Colors.white,
            //     focusColor: Colors.white,
            //     hintStyle: TextStyle(color: Colors.white70),
            //     border: InputBorder.none,
            //   ),
            //   onChanged: (value) {
            //     print("value on Change");
            //     setState(() {
            //       searchText = value;
            //     });
            //   },
            // ),
          )],
        ),
        body: ListView(
          controller: _scrollController,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => MotoAnnounce(),
                  ),
                );
              },
              child: Image.asset('asset/ads.png'),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Attijaria',style: TextStyle(color: Colors.black,fontSize: 20,),),
                  IconButton(

                    onPressed: () =>setPostOrientation("grid"),
                    icon: Image.asset(
                      'asset/frame.png',
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
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
            Container(color: Colors.black, height: 150, child: SliderList()),
            // Container(
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(23)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Card(
            //         // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            //         child: IconButton(
            //           onPressed: () => setPostOrientation("grid"),
            //           icon: Image.asset('asset/frame.png'),
            //         ),
            //       ),
            //       Card(
            //         child: TextButton.icon(
            //           label: Text(
            //             'Tier',
            //             style: TextStyle(color: Colors.grey),
            //           ),
            //           onPressed: () => setPostOrientation("list"),
            //           icon: Image.asset(
            //             'asset/swap.png',
            //             height: 20,
            //           ),
            //         ),
            //       ),
            //       Card(
            //         child: TextButton.icon(
            //           label: Text(
            //             'Filters',
            //             style: TextStyle(color: Colors.grey),
            //           ),
            //           onPressed: () => Navigator.push(context,
            //               MaterialPageRoute(builder: (builder) => Filteration())),
            //           icon: Image.asset('asset/filter.png', height: 20),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            buildProfilePost(),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 0),
              child: Image.asset(
                'asset/long.png',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.4,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                  stream: firebaseFirestore.collection("posts").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return  snapshot.data!.docs.length==0?
                      Center
                        (child: Text("Empty Posts")):
                      ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var ds=snapshot.data!.docs[index];
                          return  Card(
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
                                      child: CachedNetworkImage(imageUrl: ds['imageLink'],

                                        placeholder: (context, url) => Center(child: Image.asset("asset/infinity.gif")),

                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                    ),
                                    SizedBox(
                                      width:MediaQuery.of(context).size.width*0.4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(top: 10, left: 10),
                                              child: Text(ds['Category'])),
                                          TextButton.icon(

                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.location_pin,
                                              color: Colors.grey,
                                            ),
                                            label: Text(
                                              '${ds['address']} ',
                                              style: TextStyle(
                                                color: Colors.grey,fontSize: 12,

                                                overflow: TextOverflow.fade,
                                              ),
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
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
                                                // '2:30 PM ',

                          DateFormat.jm().format(
                          DateTime.parse(ds['time']
                              .toDate()
                              .toString())),
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Container(
                                    //   margin: EdgeInsets.only(right: 20),
                                    //   child: Column(
                                    //     children: [
                                    //       Icon(
                                    //         Icons.more_vert_outlined,
                                    //         color: Colors.grey,
                                    //       ),
                                    //       SizedBox(
                                    //         height: 30,
                                    //       ),
                                    //       Icon(
                                    //         Icons.favorite_outline_outlined,
                                    //         color: Colors.red,
                                    //       ),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            )
          ],
        ));
  }

  //Setting Orientation of post
  setPostOrientation(String postOrientation) {
    setState(() {
      this.postOrientation = postOrientation;
    });
  }

  buildProfilePost() {
    // var size = MediaQuery.of(context).size;

    // /*24 is for notification bar on Android*/
    // final double itemWidth = (size.height - kToolbarHeight - 69) / 2;
    // final double itemHeight = size.width;

    if (isLoading) {
      return CircularProgressIndicator();
    }
    //Oreientation show post as grid or list
    else if (postOrientation == "grid") {
      //Showing Profile Images In GridView Style
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 250,
          child: StreamBuilder(
              stream: firebaseFirestore.collection('posts').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return   snapshot.data!.docs.length==0?Center(child: Text("Empty Posts")):ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     crossAxisSpacing: 2,
                      //     mainAxisSpacing: 2,
                      //     childAspectRatio: 3 / 4),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext ctx, index) {
                        var ds=snapshot.data!.docs[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (builder) => ProductDetail(
                                  id: ds.id,
                                )));
                          },
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                          width: MediaQuery.of(this.context)
                              .size
                              .width /
                              2.4,
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
                                                              offset:
                                                              Offset(0, 7), // changes
                                                            )
                                                          ]),
                                                          height: 174,

                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius.circular(10),
                                                            child: CachedNetworkImage(
                                                              imageUrl: ds['imageLink'],
                                                              imageBuilder: (context, imageProvider) => Container(
                                                                decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: imageProvider,
                                                                      fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context, url) => Center(child: Image.asset("asset/infinity.gif")),
                                                              errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 10,
                                                          right: 10,
                                                          child: InkWell(
                                                            onTap: ()async{
                                                           await  ds['isFav']==false? firebaseFirestore.collection("posts").doc(ds.id).update(
                                                                  {"isFav":true}):firebaseFirestore.collection("posts").doc(ds.id).update(
                                                               {"isFav":false});
                                                            },
                                                            child:ds['isFav']==false? Icon(
                                                              Icons.favorite_border,
                                                              color: Colors.red,
                                                            ):Icon(Icons.favorite,color: Colors.red,),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                        width: MediaQuery.of(this.context)
                            .size
                            .width /
                        2.4,
                                                    margin: EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      '${ds['maxPrice']} DH',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
softWrap: true,
                                                      overflow: TextOverflow.fade,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(this.context)
                                                        .size
                                                        .width /
                                                        2.4,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(

                                                              margin:
                                                              EdgeInsets.only(left: 5),
                                                              child: Icon(
                                                                Icons.location_pin,
                                                                size: 14,
                                                                color: HexColor('#9098B1'),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                ds['address'],
                                                                style: TextStyle(
                                                                  color: HexColor('#9098B1'),
                                                                  fontSize: 5,
                                                                ),
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
                          DateFormat.jm().format(
                          DateTime.parse(ds['time']
                              .toDate()
                              .toString())),
                                                              style: TextStyle(
                                                                color: HexColor('#9098B1'),
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 8, top: 2, bottom: 8),
                                                    child: Text(
                                                      ds['title'],
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
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Icon(Icons.error_outline);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      );
    } else if (postOrientation == "list") {
      //Show post as List
      return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => ProductDetail()));
          },
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 4,
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
      );
    }
  }
}
