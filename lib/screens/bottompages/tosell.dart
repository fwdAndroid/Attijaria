import 'package:attijaria/screens/chats/chatlist.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ToSell extends StatefulWidget {
  const ToSell({Key? key}) : super(key: key);

  @override
  _ToSellState createState() => _ToSellState();
}

class _ToSellState extends State<ToSell> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Container(
                width: 60,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("asset/profilepic.png"),
                  backgroundColor: Colors.red,
                ),
              ),
              title: Text(
                'Fawad Kaleem',
                style: TextStyle(color: Colors.white),
              ),
              toolbarHeight: 90,
              backgroundColor: Colors.black,
            ),
            body: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return ListView(controller: _controller, children: [
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
                        height: 150,
                        child: ListView.builder(
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (_, i) => Row(
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
                                        child: Image.network(
                                            'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                            fit: BoxFit.fitHeight),
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
                                          'Fawad Kaleem',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Image.asset('asset/dots.png'),
                        ),
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
                      height: MediaQuery.of(context).size.height * 1,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 8,
                        itemBuilder: (_, i) => InkWell(
                          focusColor: Colors.grey,
                          hoverColor: Colors.grey,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (xtx) => ChatList()));
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('asset/profilepic.png'),
                            ),
                            title: Text(
                              'Fawad',
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(
                              'Hi How Are You',
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Text('Monday'),
                          ),
                        ),
                      ),
                    ))
              ]);
            })));
  }
}
