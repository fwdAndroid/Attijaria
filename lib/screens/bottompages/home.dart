import 'package:attijaria/orientation.dart';
import 'package:attijaria/screens/accounmenrs/iphone.dart';
import 'package:attijaria/widgets/drawer.dart';
import 'package:attijaria/widgets/girdviewlist.dart';
import 'package:attijaria/widgets/listviewgrid.dart';
import 'package:attijaria/widgets/sliderlist.dart';
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
        backgroundColor: Colors.black,
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
            scrollDirection: Axis.vertical,
            controller: _controller,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Image.asset('asset/ads.png')),
              Container(
                height: 200,
                color: Colors.black,
                child: SliderList(),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child: Orientatiosn()),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (xtc) => Iphone()));
                      },
                      child: Image.asset(
                        'asset/long.png',
                      ),
                    ),
                    ListViewGrid(
                      controller: _controller,
                    ),
                    Gridviewlist(
                      controller: _controller,
                    ),
                  ],
                ),
              )
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
