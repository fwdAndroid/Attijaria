import 'package:flutter/material.dart';

class SliderList extends StatefulWidget {
  const SliderList({Key? key}) : super(key: key);

  @override
  _SliderListState createState() => _SliderListState();
}

class _SliderListState extends State<SliderList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 140,
                      width: 100,
                      child: Image.asset('asset/boot.png'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 10),
                            child: Text('700 DH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 30)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_pin,
                                  color: Colors.grey,
                                ),
                                label: Text(
                                  'Lahore',
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
                          Text('Fawad ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
