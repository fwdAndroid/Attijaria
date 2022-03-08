import 'dart:io';

import 'package:attijaria/screens/bottompages/showimages.dart';
import 'package:attijaria/widgets/bottomchat.dart';
import 'package:attijaria/widgets/chatbubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:uuid/uuid.dart';
import '../../Utils/constant.dart';
import '../../widgets/customdialog.dart';
String lastMessage="";
String lastTime="";
class ChatList extends StatefulWidget {
  String? receiverId;
  ChatList({ Key? key,this.receiverId }) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  TextEditingController messageController=TextEditingController();
  ScrollController scrollController = ScrollController();
String groupChatId="";
String receiverimageLink="";
String receiverName="";
String senderimageLink="";
  final ImagePicker _picker = ImagePicker();
  File? imageUrl;

  String? imageLink;
  void addImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl = File(image!.path);
    });
    Customdialog.showDialogBox(context);
    await uploadImageToFirebase().then((value) {
      var documentReference = firebaseFirestore
          .collection('messages')
          .doc(groupChatId)
          .collection(groupChatId)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());
      firebaseFirestore.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {
            "senderId": firebaseAuth.currentUser!.uid,
            "receiverId": widget.receiverId,
            // "content": messageController.text,
            "time": DateTime.now(),
            'image': imageLink,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
            // 'content': content,
            'type': 1
          },
        );
      });
    }).then((value) {
      Customdialog.closeDialog(context);
      FocusScope.of(context).unfocus();
      messageController.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    if (firebaseAuth.currentUser!.uid.hashCode <= widget.receiverId.hashCode) {
      groupChatId = "${firebaseAuth.currentUser!.uid}-${widget.receiverId}";
    } else {
      groupChatId = "${widget.receiverId}-${firebaseAuth.currentUser!.uid}";
    }
    firebaseFirestore.collection("users").doc(widget.receiverId).get().then((value) {
      setState(() {
        receiverimageLink= value.get("imageLink");
        receiverName=value.get("UserName");
      });
    });
    firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).get().then((value) {
      setState(() {
        senderimageLink= value.get("imageLink");
        // receiverName=value.get("UserName");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    
    var appSize=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(9),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      // backgroundImage: AssetImage('asset/profilepic.png'),
                   child: CachedNetworkImage(
                     imageUrl:receiverimageLink,
                     imageBuilder: (context, imageProvider) => Container(
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
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
                    CircleAvatar(
                      radius: 30,
                      // backgroundImage: AssetImage('asset/profilepic.png'),
                   child: CachedNetworkImage(
                     imageUrl:senderimageLink,
                     imageBuilder: (context, imageProvider) => Container(
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
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
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${receiverName}",softWrap: true),
                    SizedBox(
                      height: 5,
                    ),
                    // Text('Sadiq'),
                  ],
                ),
              ),
            ),
Container(
              margin: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '30 May 2021',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height:appSize.height*0.67,
              width: appSize.width,
              child: StreamBuilder(
                  stream: firebaseFirestore.collection("messages").doc(groupChatId).collection(groupChatId).orderBy("timestamp",descending: true).snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {

                      return snapshot.data!.docs==0?Text("Empty "): ListView.builder(
                          controller: scrollController,
                          reverse: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                            var ds=snapshot.data!.docs[index];
          lastMessage=snapshot.data!.docs.last['content'];
                            lastTime=snapshot.data!.docs.last['timestamp'];

                            return
                        ds['senderId']==firebaseAuth.currentUser!.uid?
                        ds['type']==0?
                        Container(

                         margin: EdgeInsets.all(10),
                         child:ChatBubble(
                           text: ds['content'],
                           isCurrentUser: true,
                         )

                          ):SizedBox(height: 150,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(100.0, 4.0, 16.0, 4
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder:
                                        (context)=>
                                            ShowImages(
                                                imageLink: ds['image']
                                            )
                                    ));
                              },
                              child: CachedNetworkImage(
                                imageUrl: ds['image'],
                                imageBuilder: (context,
                                    imageProvider) =>
                                    Container(
                                      decoration:
                                      BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                        image:
                                        DecorationImage(
                                          image:
                                          imageProvider,
                                          fit: BoxFit.scaleDown,
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
                        ):
                      ds['type']==0? Container(
                           margin: EdgeInsets.all(10),
                           child: ChatBubble(
                             text: ds['content'],
                             isCurrentUser: false,
                           ),
                         ):SizedBox(height: 150,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 4.0, 100.0, 4
                          ),
                          child: InkWell(
                         onTap: (){
                           Navigator.push(context,
                               MaterialPageRoute(builder:
                                   (context)=>
                                   ShowImages(
                                       imageLink: ds['image']
                                   )
                               ));
                         },
                            child: CachedNetworkImage(
                              imageUrl: ds['image'],
                              imageBuilder: (context,
                                  imageProvider) =>
                                  Container(
                                    decoration:
                                    BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image:
                                      DecorationImage(
                                        image:
                                        imageProvider,
                                        fit: BoxFit.scaleDown,
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
                      );
                      });
                    } else if (snapshot.hasError) {
                      return Center(child: Icon(Icons.error_outline));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )
 ,           Row(
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
                          controller: messageController,
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            suffixIcon: InkWell(
                              onTap: (){
                                sendMessage(messageController.text.trim(), 0);
                              },
                              child: Padding(
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
                                    child: Image.asset('asset/union.png')),
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Color(0xffF8B800),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                        child: InkWell(
                            onTap: addImage,
                            child: Icon(Icons.camera_alt, color: Colors.white)),
                      ),
                      // IconButton(
                      //     icon: Icon(
                      //       Icons.camera_alt,
                      //       color: Color(0xffF8B800),
                      //     ),
                      //     onPressed: () {})
                    ],

                  ),
                ),

              ],
            )
          ],
        ),),
        
      
    );
  }

  void sendMessage(String content, int type) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      messageController.clear();

      var documentReference = firebaseFirestore
          .collection('messages')
          .doc(groupChatId)
          .collection(groupChatId)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      firebaseFirestore.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {
            "senderId": firebaseAuth.currentUser!.uid,
            "receiverId": widget.receiverId,
            "time": DateTime.now(),
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
            'content': content,
            'type': type
          },
        );
      });
      scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      // Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }
  Future uploadImageToFirebase() async {
    File? fileName = imageUrl;
    var uuid = Uuid();
    firebase_storage.Reference firebaseStorageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('messages/images+${uuid.v4()}');
    firebase_storage.UploadTask uploadTask =
    firebaseStorageRef.putFile(fileName!);
    firebase_storage.TaskSnapshot taskSnapshot =
    await uploadTask.whenComplete(() async {
      print(fileName);
      String img = await uploadTask.snapshot.ref.getDownloadURL();
      setState(() {
        imageLink = img;
      });
    });
  }
}