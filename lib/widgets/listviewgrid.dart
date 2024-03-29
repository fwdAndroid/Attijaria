import 'package:flutter/material.dart';

class ListViewGrid extends StatefulWidget {
  @override
  _ListViewGridState createState() => _ListViewGridState();
}

class _ListViewGridState extends State<ListViewGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 140,
                      width: 100,
                      child: Image.asset('asset/watch.png'),
                    ),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            child: Text('Apple Watch')),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.location_pin,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Lahore \n DHA ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.timer,
                              color: Colors.grey,
                            ),
                            label: Text(
                              '2:30 PM ',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Icon(
                            Icons.move_to_inbox,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.favorite_outline_outlined,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
