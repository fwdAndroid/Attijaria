import 'package:flutter/material.dart';

class Gridviewlist extends StatefulWidget {
  final ScrollController controller;
  Gridviewlist({required this.controller});

  @override
  State<Gridviewlist> createState() => _GridviewlistState();
}

class _GridviewlistState extends State<Gridviewlist> {
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
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 1,
      child: GridView.builder(
        controller: controller,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 15),
        itemCount: 6,
        itemBuilder: (BuildContext ctx, index) {
          return Stack(
            children: [
              GridTile(
                child: Image.asset(
                  'asset/comp.png',
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.white,
                  title: Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      '700 HD',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.location_pin, color: Colors.grey),
                      Text(
                        'Lahore',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.grey,
                      ),
                      Text('9:30 PM')
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 125,
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              )
            ],
          );
        },
      ),
    );
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
