import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: ListTile(
          title: Center(
            child: Text(
              'Attijjara',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Voiluter()),
              // );
            },
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
          ),
          trailing: Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Image.asset('asset/group.png'),
                    Text(
                      'Premium Ads',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(93, 85, 180, 1)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: ListView.builder(
              itemCount: 13,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 140,
                              width: 100,
                              child: Image.network(
                                  'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/42-alu-silver-sport-white-nc-s3-grid?wid=540&hei=550&fmt=jpeg&qlt=80&.v=1594259786000'),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ListTile(
                              title: Column(
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 10),
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
                              trailing: Container(
                                height: MediaQuery.of(context).size.height * 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.favorite_outline_outlined,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
