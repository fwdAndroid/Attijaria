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
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: scrollController,
        children: [
          //Change the posts view in grid or listview same as instagram
          buildTogglePostOrientation(),
          Divider(
            height: 0,
          ),
          //Showing Profile Post
          buildProfilePost()
        ],
      ),
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
      Gridviewlist(
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

//Changing Post View
  buildTogglePostOrientation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => setPostOrientation("grid"),
          icon: Icon(Icons.grid_on,
              color: postOrientation == "grid"
                  ? Theme.of(context).primaryColor
                  : Colors.grey),
        ),
        IconButton(
          onPressed: () => setPostOrientation("list"),
          icon: Icon(Icons.list,
              color: postOrientation == "list"
                  ? Theme.of(context).primaryColor
                  : Colors.grey),
        ),
      ],
    );
  }
}
