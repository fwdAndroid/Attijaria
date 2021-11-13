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
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 1,
      child: GridView.builder(
        controller: controller,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 13 / 16,
            crossAxisSpacing: 16,
            mainAxisSpacing: 15),
        itemCount: 6,
        itemBuilder: (BuildContext ctx, index) {
          return Stack(
            children: [
              GridTile(
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage("asset/comp.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                footer: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GridTileBar(
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
              ),
              Positioned(
                top: 10,
                left: 130,
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
