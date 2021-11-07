import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width / 1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
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
                  footer: Card(
                    elevation: 4,
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
                  top: 60,
                  left: 125,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                )
              ],
            );
          },
        ),
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
