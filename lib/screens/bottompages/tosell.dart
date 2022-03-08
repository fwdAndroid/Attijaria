import 'package:attijaria/screens/chats/chatlist.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Utils/constant.dart';

class ToSell extends StatefulWidget {
  const ToSell({Key? key}) : super(key: key);

  @override
  _ToSellState createState() => _ToSellState();
}

class _ToSellState extends State<ToSell> with WidgetsBindingObserver {
  String myName="";
  String imageLink="";
  @override
  void initState() {
    // TODO: implement initState
  firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).get().then((value) {
   setState(() {
     imageLink= value.get("imageLink");
     myName=value.get("UserName");
   });
  });
  WidgetsBinding.instance!.addObserver(this);
  setStatus("online");
    super.initState();
  }
  void setStatus(String status )async{
    await firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).update({
      "status":status
    });
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  if(state==AppLifecycleState.resumed){
    setStatus("online");
  }
  else{
    setStatus("offline");
  }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Container(
                width: 60,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.red,
             child: CachedNetworkImage(
               imageUrl: imageLink,
               imageBuilder: (context,
                   imageProvider) =>
                   Container(
                     decoration:
                     BoxDecoration(
                       shape:
                       BoxShape.circle,
                       image:
                       DecorationImage(
                         image:
                         imageProvider,
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
               placeholder: (context,
                   url) =>
                   Center(
                       child: Image.asset(
                           "asset/infinity.gif")),
               errorWidget: (context,
                   url, error) =>
                   Center(
                       child: Icon(
                           Icons.error)),
             ),
                ),
              ),
              title: Text(
                myName,
                style: TextStyle(color: Colors.white),
              ),
              toolbarHeight: 90,
              backgroundColor: Colors.black,
            ),
            body: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return ListView(children: [
                Container(
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                    child: Container(
                                        height: 57,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              topLeft: Radius.circular(15)),
                                          color: HexColor("#9098B1"),
                                        ),
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        )),
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: HexColor('#F8B800'),
                                  borderRadius: BorderRadius.circular(15)),
                              height: 50,
                              width: 50,
                              child: Icon(Icons.add, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 15, bottom: 10),
                        child: Text(
                          'Connected',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        height: 130,
                        child: StreamBuilder(
                            stream: firebaseFirestore.collection("users").where("id",isNotEqualTo: firebaseAuth.currentUser!.uid).where("status",isEqualTo: "online").snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return snapshot.data!.docs==0?Center(child: Text("No AnyOne Online",style: TextStyle(color: Colors.white),)): ListView.builder(
                                  // controller: _controller,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (_, i) {
var ds=snapshot.data!.docs[i];
                                    return Row(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 175,
                                                width: 100,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    imageUrl: ds['imageLink'],
                                                    imageBuilder: (context,
                                                        imageProvider) =>
                                                        Container(
                                                          decoration:
                                                          BoxDecoration(
                                                            image:
                                                            DecorationImage(
                                                              image:
                                                              imageProvider,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                    placeholder: (context,
                                                        url) =>
                                                        Center(
                                                            child: Image.asset(
                                                                "asset/infinity.gif")),
                                                    errorWidget: (context,
                                                        url, error) =>
                                                        Center(
                                                            child: Icon(
                                                                Icons.error)),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                  top: 10,
                                                  right: 10,
                                                  child: Image.asset('asset/green.png')),
                                              Positioned(
                                                  bottom: 50,
                                                  left: 5,
                                                  child: Text(
                                                    ds['UserName'],
                                                    style: TextStyle(color: Colors.white),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    );
                                  } ,
                                );
                              } else if (snapshot.hasError) {
                                return Center(child: Icon(Icons.error_outline));
                              } else {
                                return Center(child: CircularProgressIndicator());
                              }
                            }),
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 15),
                            child: DotsIndicator(dotsCount: 5)),
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: SizedBox(
                      height: 300,
                      child: StreamBuilder(
                          stream: firebaseFirestore
                              .collection("users")
                              .where("id",
                                  isNotEqualTo: firebaseAuth.currentUser!.uid)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              return snapshot.data!.size == 0
                                  ? Center(child: Text("Empty"))
                                  : ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (_, i) {
                                        var ds = snapshot.data!.docs[i];
                                        return InkWell(
                                          focusColor: Colors.grey,
                                          hoverColor: Colors.grey,
                                          onTap: () {
                                            // Navigator.push(context,
                                            //     MaterialPageRoute(builder: (xtx) => Favoris()));
                                          },
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          ChatList(
                                                            receiverId: ds.id,
                                                          )));
                                            },
                                            leading: ds['imageLink'] == null
                                                ? CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/logo.png'),
                                                  )
                                                : CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 30,
                                                    // backgroundImage:
                                                    // NetworkImage(ds['imageLink']),
                                                    child: CachedNetworkImage(
                                                      imageUrl: ds['imageLink'],
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child: Image.asset(
                                                                  "asset/infinity.gif")),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Center(
                                                              child: Icon(
                                                                  Icons.error)),
                                                    )),
                                            title: Text(
                                              ds['UserName'],
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            subtitle: Text(
                                              lastMessage,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            trailing: Text('Monday'),
                                          ),
                                        );
                                      });
                            } else if (snapshot.hasError) {
                              return Center(child: Icon(Icons.error_outline));
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                    ))
              ]);
            })));
  }
}
