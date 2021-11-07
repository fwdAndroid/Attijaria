import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (_, i) => Card(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                elevation: 5,
                child: ListTile(
                  leading: Image.asset('asset/laptop.png'),
                  title: Text(
                    'Laptop in Laptops',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    'All of morocco',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  trailing: Image.asset('asset/delete.png'),
                ),
              ),
            ),
          )),
    );
  }
}
