import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: size.width,
                fit: BoxFit.cover,
                image: AssetImage(
                  'asset/pic.png',
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: Text(
                  'Save your most interesting searches',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  child: Text('Search'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(243, 57),
                    primary: Color.fromRGBO(248, 184, 0, 1),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
