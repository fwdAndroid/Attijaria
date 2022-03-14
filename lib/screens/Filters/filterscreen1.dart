import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Providers/allproviders.dart';
import '../../Utils/constant.dart';
import '../productdetails/productdetails.dart';

class FiltersScreen2 extends StatefulWidget {
  const FiltersScreen2({ Key? key }) : super(key: key);

  @override
  State<FiltersScreen2> createState() => _FiltersScreen2State();
}

class _FiltersScreen2State extends State<FiltersScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder(
              stream: firebaseFirestore.collection("posts").where("Category",isEqualTo: Provider.of<AllpProviders>(context,listen: true).cetagory)
                  .where("Subcategory",isEqualTo: Provider.of<AllpProviders>(context,listen: true).subcetagory)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {

                  return snapshot.data!.docs.length==0?Center(child: Text("Empty")): GridView.builder(
                      controller: new ScrollController(keepScrollOffset: false),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 8,
                          childAspectRatio: 2 / 3),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext ctx, index) {
                        var ds=snapshot.data!.docs[index];
                        return Row(
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
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Row(
                                        children: [
                                          InkWell(
                        onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => ProductDetail(
                        id: ds.id,
                        )));
                        },                                            child: Card(
                                              margin: EdgeInsets.only(left: 0),
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
                                                        2.26,
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
                                                              imageUrl: ds['imageLink'][0],
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
                      });
                } else if (snapshot.hasError) {
                  return Center(child: Icon(Icons.error_outline));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));


  }
}