import 'package:attijaria/Utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SliderList extends StatefulWidget {
  const SliderList({Key? key}) : super(key: key);

  @override
  _SliderListState createState() => _SliderListState();
}

class _SliderListState extends State<SliderList> {
  final String bootImage = 'asset/paint.svg';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 1,
      child: StreamBuilder(
          stream: firebaseFirestore.collection("cetagories").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var ds=snapshot.data!.docs[index];
                  return SizedBox(
                    height: 500,
                    width: 150,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: ds['imageUrl'],
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Center(child: Image.asset("asset/infinity.gif")),
                              errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                            ) ,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 5, left: 10),child: Text(
                                  ds['cetagory'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 15

                                  ),
                                ),),
                                Container(
                                  margin: EdgeInsets.only(bottom: 4, left: 10),
                                  child: Text(ds['price'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 15)),
                                ),
                              ],
                            )
                          ],
                        )
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
