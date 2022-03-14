import 'package:attijaria/Providers/allproviders.dart';
import 'package:attijaria/separaterpages/adsNew.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectSubCategories extends StatefulWidget {
  const SelectSubCategories({Key? key}) : super(key: key);

  @override
  State<SelectSubCategories> createState() => _SelectSubCategoriesState();
}

class _SelectSubCategoriesState extends State<SelectSubCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select SubCategories',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          InkWell(
            onTap: () {},
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
                  Text(Provider.of<AllpProviders>(context).cetagory ??
                      'Choose Category'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
                          Provider.of<AllpProviders>(context).cetagory ==
                                  "Computing and Multimedia"
                              ? Column(
                                  children: [
                                    Divider(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Telephones");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Telephones')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Tablet");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Tablet')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Computers portables");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Computers portables')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Computers Accessorie");
                                            Navigator.pop(context);
                                          },
                                          child: Text("Computers Accessorie")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Video Game Console");
                                            Navigator.pop(context);
                                          },
                                          child: Text("Video Game Console")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Cameras and Cameras");
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cameras and Cameras")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory(
                                                "Television");
                                            Navigator.pop(context);
                                          },
                                          child: Text("Television")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory(
                                                "Image & Sons");
                                            Navigator.pop(context);
                                          },
                                          child: Text("Image & Sons")),
                                    ),
                                  ],
                                )
                              : Container(),
                          // Divider(),
                          // Row(
                          //   children: [
                          //     Icon(Icons.car_rental),
                          //     SizedBox(width: 20),
                          //     Text(
                          //       'Vehicles',
                          //       style: TextStyle(fontSize: 12),
                          //     ),
                          //   ],
                          // ),
                          // Divider(),

                          Provider.of<AllpProviders>(context).cetagory ==
                                  'Vehicles'
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Cars");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cars')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Car Rental");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Car Rental')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Parts and Accessories");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Parts and Accessories')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory(
                                                "Motors");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Motors')),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Velos");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Velos')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory(
                                                "Arrow");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Arrow')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Engins BTP");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Engins BTP')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Engine Agircole");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Engine Agircole')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Trucks");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Trucks')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Others");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Others')),
                                    ),

                                    Divider(),
                                  ],
                                )
                              : Container(),
                          // Row(
                          //   children: [
                          //     Icon(Icons.home),
                          //     SizedBox(width: 20),
                          //     Text(
                          //       'Real Estate',
                          //       style: TextStyle(fontSize: 12),
                          //     )
                          //   ],
                          // ),
                          // Divider(),
                          Provider.of<AllpProviders>(context).cetagory ==
                                  'Real Estate'
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Appartments");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Appartments')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Maisons and Villas");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Maisons and Villas')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Desks and Trays");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Desks and Trays')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Magsins");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Magsins')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Lands and Farms");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Lands and Farms')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Other Real Estate");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Other Real Estate')),
                                    ),
                                    Divider(),
                                  ],
                                )
                              : Container(), //  Row(
                          //   children: [
                          //     Icon(Icons.gradient),
                          //     SizedBox(width: 20),
                          //     Text(
                          //       'FOR HOME AND GARDEN',
                          //       style: TextStyle(fontSize: 12),
                          //     )
                          //   ],
                          // ),
                          // Divider(),
                          Provider.of<AllpProviders>(context).cetagory ==
                                  'FOR HOME AND GARDEN'
                              ? Column(
                                  children: [
                                    Container(
                                        padding:EdgeInsets.symmetric(vertical: 10),
                                        child: InkWell(
                                            onTap: (){
                                              Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Appliances and Tableware");
                                              Navigator.pop(context);
                                            },
                                            child: Text('Appliances and Tableware'))),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Furniture and Decoration");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Furniture and Decoration')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Garden and DIY Tools');
                                            Navigator.pop(context);
                                          },
                                          child: Text('Garden and DIY Tools')),
                                    )
                                  ],
                                )
                              : Container()
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
                  Text(Provider.of<AllpProviders>(context).subcetagory??'Choose SubCategory'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
               if(Provider.of<AllpProviders>(context,listen: false).subcetagory!.isEmpty){
                 Customdialog().showInSnackBar("Please select Subcetagory", context);
               }
               else if(Provider.of<AllpProviders>(context,listen: false).subcetagory!.isNotEmpty) {
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (builder) => AddNewsPosts(cetagory: "jh")));
               } },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 50), primary: Color(0xffF8B800)),
              ))
        ],
      ),
    );
  }
}
