import 'package:attijaria/widgets/girdviewlist.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Favourite extends StatefulWidget {
  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  ScrollController controller = ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  controller: controller,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 13 / 18,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 7),
                  itemCount: 4,
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
                            Expanded(
                              child: Column(
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
                            ),
                          ],
                        ),
                      ],
                    );
                  })),
        ));
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
}
