import 'package:attijaria/widgets/drawer.dart';
import 'package:attijaria/widgets/girdviewlist.dart';
import 'package:attijaria/widgets/listviewgrid.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return ListView(
            controller: _controller,
            children: [
              Image.asset('asset/ads.png'),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Image.asset('asset/group.png'),
                    Text(
                      'Premium Ads',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(93, 85, 180, 1)),
                    ),
                  ],
                ),
              ),
              Gridviewlist(
                controller: _controller,
              ),
              Image.asset(
                'asset/long.png',
              ),
              ListViewGrid(
                controller: _controller,
              ),
              Gridviewlist(
                controller: _controller,
              ),
            ],
          );
        }));
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
}
