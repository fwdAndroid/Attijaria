import 'package:attijaria/Providers/allproviders.dart';
import 'package:attijaria/separaterpages/adsNew.dart';
import 'package:attijaria/separaterpages/selectsubcategaries.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Provider.of<AllpProviders>(context,listen: false).setCetagory("Computing and Multimedia");
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Image.asset('assets/gg.png',height: 30,width: 30,),
                                SizedBox(width: 20),
                                Text(
                                  'Computing and Multimedia',
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
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
                          InkWell(
                            onTap: (){
                              Provider.of<AllpProviders>(context,listen: false).setCetagory("Vehicles");
                            Navigator.pop(context);
                              },

                            child: Row(
                              children: [
                                 Image.asset('assets/vw.png',height: 30,width: 30,),
                                SizedBox(width: 20),
                                Text(
                                  'Vehicles',
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
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
                          InkWell(
                            onTap: (){
                              Provider.of<AllpProviders>(context,listen: false).setCetagory('Real Estate');
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                 Image.asset('assets/hw.png',height: 30,width: 30,),
                                SizedBox(width: 20),
                                Text(
                                  'Real Estate',
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Text('Appartments'),
                          Text('Maisons and Villas'),
                          Text('Desks and Trays'),
                          Text('Magsins'),
                          Text('Lands and Farms'),
                          Text('Other Real Estate'),
                          
                          Divider(),
                           InkWell(
                             onTap: (){
                               Provider.of<AllpProviders>(context,listen: false).setCetagory("FOR HOME AND GARDEN");
                               Navigator.pop(context);
                               },
                             child: Row(
                              children: [
                                Image.asset('assets/v.png',height: 30,width: 30,),
                                SizedBox(width: 20),
                                Text(
                                  'FOR HOME AND GARDEN',
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                )
                              ],
                          ),
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
                  Text(Provider.of<AllpProviders>(context).cetagory??'Choose Category'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          Spacer(),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: ElevatedButton(onPressed: (){
         if(Provider.of<AllpProviders>(context,listen: false).cetagory!.isEmpty){}else if(Provider.of<AllpProviders>(context,listen: false).cetagory!.isNotEmpty){     Navigator.push(context, MaterialPageRoute(builder: (builder) => AddNewsPosts(cetagory: 'jh',)));
         }
            }, child: Text('Continue'),style: ElevatedButton.styleFrom(fixedSize: Size(300, 50),primary: Color(0xffF8B800)),))
        ],
      ),
    );
  }
}
