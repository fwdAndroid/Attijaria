import 'package:attijaria/separaterpages/selectsubcategaries.dart';
import 'package:flutter/material.dart';

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector({Key? key}) : super(key: key);

  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                    Spacer(),


          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.laptop),
                              SizedBox(width: 20),
                              Text(
                                'Computing and Multimedia',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          Divider(),
                          Text('Telephones'),
                          Text('Tablet'),
                          Text('Computers portables'),
                          Text('Computers Accessorie'),
                          Text('Video Game Console'),
                          Text('Cameras and Cameras'),
                          Text('Television'),
                          Text('Image & Sons'),
                          Divider(),
                          Row(
                            children: [
                              Icon(Icons.car_rental),
                              SizedBox(width: 20),
                              Text(
                                'Vehicles',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Divider(),
                          Text('Cars'),
                          Text('Car rental'),
                          Text('Parts and Accessories'),
                          Text('Motors'),
                          Text('Velos'),
                          Text('Arrow'),
                          Text('Engins BTP'),
                          Text('Engine Agircole'),
                          Text('Trucks'),
                          Text('Others'),
                          Divider(),
                          Row(
                            children: [
                              Icon(Icons.home),
                              SizedBox(width: 20),
                              Text(
                                'Real Estate',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          Divider(),
                          Text('Appartments'),
                          Text('Maisons and Villas'),
                          Text('Desks and Trays'),
                          Text('Magsins'),
                          Text('Lands and Farms'),
                          Text('Other Real Estate'),
                          
                          Divider(),
                           Row(
                            children: [
                              Icon(Icons.gradient),
                              SizedBox(width: 20),
                              Text(
                                'FOR HOME AND GARDEN',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          Divider(),
                          Text('Appliances and Tableware'),
                          Text('Furniture and Decoration'),
                          Text('Garden and DIY Tools')
                    
                        ],
                      ),
                    ),
               
                  );
                },
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.grey.shade100)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Choose Category'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          Spacer(),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder) => SelectSubCategories()));
            }, child: Text('Continue'),style: ElevatedButton.styleFrom(fixedSize: Size(300, 50),primary: Color(0xffF8B800)),))
        ],
      ),
    );
  }
}
