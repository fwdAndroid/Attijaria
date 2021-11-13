import 'package:attijaria/screens/accounmenrs/iphone.dart';
import 'package:attijaria/widgets/girdviewlist.dart';
import 'package:attijaria/widgets/listviewgrid.dart';
import 'package:flutter/material.dart';

class Orientatiosn extends StatefulWidget {
  @override
  _OrientatiosnState createState() => _OrientatiosnState();
}

class _OrientatiosnState extends State<Orientatiosn> {
  bool isLoading = false;
  String postOrientation = "grid";
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  bool isTOuch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return ListView(
          controller: scrollController,
          children: [
            //Change the posts view in grid or listview same as instagram
            buildTogglePostOrientation(),

            //Showing Profile Post
            buildProfilePost(),
            //   buildCompletePost()
          ],
        );
      }),
    );
  }

  //Functions

  buildProfilePost() {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    //Oreientation show post as grid or list
    else if (postOrientation == "grid") {
      //Showing Profile Images In GridView Style
      return Gridviewlist(
        controller: scrollController,
      );
    } else if (postOrientation == "list") {
      //Show post as List
      return ListViewGrid(
        controller: scrollController,
      );
    }
  }

  //Setting Orientation of post
  setPostOrientation(String postOrientation) {
    setState(() {
      this.postOrientation = postOrientation;
    });
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        String message = "reach the bottom";
        print(message);
      });
    }
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        String message = "reach the top";
        print(message);
      });
    }
  }

  buildCompletePost() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (xtc) => Iphone()));
          },
          child: Gridviewlist(
            controller: scrollController,
          ),
        ),
        Image.asset(
          'asset/long.png',
        ),
        ListViewGrid(
          controller: scrollController,
        ),
        Gridviewlist(
          controller: scrollController,
        ),
      ],
    );
  }

//Changing Post View
  buildTogglePostOrientation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: IconButton(
            onPressed: () => setPostOrientation("grid"),
            icon: Image.asset('asset/frame.png'),
          ),
        ),
        Card(
          child: TextButton.icon(
            label: Text(
              'Tier',
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: () => setPostOrientation("list"),
            icon: Image.asset('asset/swap.png'),
          ),
        ),
      ],
    );
  }
}
