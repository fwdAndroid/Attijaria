import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Gridviewlist extends StatefulWidget {
  @override
  State<Gridviewlist> createState() => _GridviewlistState();
}

class _GridviewlistState extends State<Gridviewlist> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemWidth = (size.height - kToolbarHeight - 24) / 2;
    final double itemHeight = size.width / 2;

    return Container(
        width: MediaQuery.of(context).size.width,
        height: 800,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: itemWidth / itemHeight,
                crossAxisSpacing: 7,
                mainAxisSpacing: 3),
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
                                                  offset:
                                                      Offset(0, 7), // changes
                                                )
                                              ]),
                                              height: 174,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Icon(
                                                  Icons.location_pin,
                                                  size: 14,
                                                  color: HexColor('#9098B1'),
                                                ),
                                              ),
                                              Text(
                                                'Casablanca',
                                                style: TextStyle(
                                                  color: HexColor('#9098B1'),
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
                                                  color: HexColor('#9098B1'),
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
            }));
  }
}
