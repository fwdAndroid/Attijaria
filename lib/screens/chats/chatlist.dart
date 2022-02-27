import 'package:attijaria/widgets/bottomchat.dart';
import 'package:attijaria/widgets/chatbubble.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  const ChatList({ Key? key }) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    bottomNavigationBar: BottomChatClass();
    
    
    
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
                      onPressed: () {},
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
                      backgroundImage: AssetImage('asset/profilepic.png'),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('asset/profilepic.png'),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Fawad'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Sadiq'),
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
            Container(
              margin: EdgeInsets.all(10),
              child: ChatBubble(
                text: 'Hi,How are you, We can not meet long time ago',
                isCurrentUser: true,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ChatBubble(
                text: 'Yes Let make a time',
                isCurrentUser: false,
              ),
            )
          ],
        ),),
        
      
    );
  }
}