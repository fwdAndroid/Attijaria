import 'package:attijaria/Providers/allproviders.dart';
import 'package:attijaria/screens/Filters/filterscreen1.dart';
import 'package:attijaria/separaterpages/adsNew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FitersScreen extends StatefulWidget {
  const FitersScreen({Key? key}) : super(key: key);

  @override
  State<FitersScreen> createState() => _FitersScreenState();
}

class _FitersScreenState extends State<FitersScreen> {
  String dropdownValueCategory = "Vehicles";
  RangeValues rangevalues = RangeValues(1.0, 10.0);
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
//TextFormFIeld
  Widget _textFormFieldFunctionIcon(
      TextEditingController controller,
      // String? Function(String?)? validator,
      String Active,
      ) {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 10, right: 20, top: 10),
      child: TextFormField(
        enabled: controller.text.isNotEmpty ? false : true,
        controller: controller,
        // validator: validator,
        autocorrect: true,
        decoration: InputDecoration(
            hintText: Active,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
            )),
      ),
    );
  }

  TextEditingController titleController = TextEditingController();

  //Text Field Title
  _titleText(String s) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20),
      child: Text(
        s,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff18191A),
            fontStyle: FontStyle.normal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   var appSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(height: appSize.height*0.06,),
          _titleText('Categories'),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: DropdownButtonFormField<String>(
                value: dropdownValueCategory,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.pinkAccent),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Category",
                    fillColor: Colors.white),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueCategory = newValue!;
                  });
                },
                items: <String>[
                  'Computing and Multimedia',
                  'Vehicles',
                  'Real Estate',
                  "Shops,bussiness and Industrial Premises",
                  "FOR HOME AND GARDEN",
                  "Clothing and well-being",
                  "Liesure and entertainment",
                  "Employment and Services",
                  "Companies"
                      "Others"
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),

              )),
              _titleText('SubCetagory'),
              SizedBox(height: appSize.height*0.02,),
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
                              Row(
                                children: [
                                  Image.asset('asset/gg.png',height: 30,width: 30,),
                                  SizedBox(width: 20),
                                  Text(
                                    'Computing and Multimedia',
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("SmartPhones");
                                          Navigator.pop(context);
                                        },
                                        child: Text('SmartPhones')),
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
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Desktop Computers");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Desktop Computers')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Laptops");
                                          Navigator.pop(context);
                                        },
                                        child: Text("Laptops")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Computer Accessories and gadgets");
                                          Navigator.pop(context);
                                        },
                                        child: Text("Computer Accessories and gadgets")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Pictures");
                                          Navigator.pop(context);
                                        },
                                        child: Text("Pictures")),
                                  ),

                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Image.asset('asset/vw.png',height: 30,width: 30,),
                                  SizedBox(width: 20),
                                  Text(
                                    'Vehicles',
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Divider(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Motorcycles");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Motorcycles')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("bikes");
                                          Navigator.pop(context);
                                        },
                                        child: Text('bikes')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory(
                                              "Professional Vehicles");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Professional Vehicles')),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Construction Machinery");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Construction Machinery')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory(
                                              "Agriculure Machinery");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Agriculure Machinery')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Trailer and carvan");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Trailer and carvan')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Boats");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Boats')),
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
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Part and accessories for vehicles");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Part and accessories for vehicles')),
                                  ),

                                  Divider(),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('asset/hw.png',height: 30,width: 30,),
                                  SizedBox(width: 20),
                                  Text(
                                    'Real Estate',
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Divider(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Houses and Villas");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Houses and Villas')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Store,bussiness and Industrial premises");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Store,bussiness and Industrial premises')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Offices and Trays");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Offices and Trays')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Vacation");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Vacation')),
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
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Roommates");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Roommates')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Garden and DIY tools");
                                          Navigator.pop(context);
                                        },
                                        child: Text('Garden and DIY tools')),
                                  ),
                                  Divider(),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('asset/vila.png',height: 30,width: 30,),
                                  SizedBox(width: 20),
                                  Text(
                                    'FOR HOME AND GARDEN',
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Divider(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding:EdgeInsets.symmetric(vertical: 10),
                                      child: InkWell(
                                          onTap: (){
                                            Provider.of<AllpProviders>(context,listen: false).setSubCetagory("Appliances and dishes");
                                            Navigator.pop(context);
                                          },
                                          child: Text('Appliances and dishes'))),
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
                                  ),
                                  Divider(),
                                  InkWell(
                                    onTap: () {
                                      Provider.of<AllpProviders>(context, listen: false)
                                          .setCetagory("Clothing and well-being");
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/shirt.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          'Clothing and well-being',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Clothing');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Clothing')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Watches and Jewellery');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Watches and Jewellery')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Bags and accessories');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Bags and accessories')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Clothing for childern and babies');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Clothing for childern and babies')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Beauty Products');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Beauty Products')),
                                  ),
                                  Divider(),
                                  InkWell(
                                    onTap: () {
                                      Provider.of<AllpProviders>(context, listen: false)
                                          .setCetagory("Liesure and entertainment");
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/game.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          'Liesure and entertainment',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Supports and leisures');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Supports and leisures')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Animals');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Animals')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Musical Instruements');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Musical Instruements')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Art and Collections');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Art and Collections')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Travels and ticketing');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Travels and ticketing')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Movies,Books,Magzines');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Movies,Books,Magzines')),
                                  ),
                                  Divider(),
                                  InkWell(
                                    onTap: () {
                                      Provider.of<AllpProviders>(context, listen: false)
                                          .setCetagory("Employment and Services");
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/employment.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          'Employment and Services',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Jobs');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Jobs')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Internship Offers');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Internship Offers')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Call Center');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Call Center')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Frames');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Frames')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('IT Professions');
                                          Navigator.pop(context);
                                        },
                                        child: Text('IT Professions')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('House Keepers,Nany Drivers');
                                          Navigator.pop(context);
                                        },
                                        child: Text('House Keepers,Nany Drivers')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('House Works');
                                          Navigator.pop(context);
                                        },
                                        child: Text('House Works')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Job Applications');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Job Applications')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Services');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Services')),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Bussiness and commercials affairs');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Bussiness and commercials affairs')),
                                  ),
                                  Divider(),

                                  InkWell(
                                    onTap: () {
                                      Provider.of<AllpProviders>(context, listen: false)
                                          .setCetagory("Companies");
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/sdq.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          'Companies',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory('Professional Equipment');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Professional Equipment')),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory(' Stock and wholesales');
                                          Navigator.pop(context);
                                        },
                                        child: Text(' Stock and wholesales')),

                                  ),
                                  Divider(),
                                  InkWell(
                                    onTap: () {
                                      Provider.of<AllpProviders>(context, listen: false)
                                          .setCetagory("Others");
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/others.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          'Others',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                        onTap: (){
                                          Provider.of<AllpProviders>(context,listen: false).setSubCetagory(' Stock and wholesales');
                                          Navigator.pop(context);
                                        },
                                        child: Text(' Stock and wholesales')),

                                  ),
                                ],
                              )
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
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Provider.of<AllpProviders>(context).subcetagory??'Choose Category'),
                        Icon(Icons.arrow_downward_outlined)
                      ],
                    ),
                  ),
                ),
              ),
          _titleText('Title'),
          _textFormFieldFunctionIcon(titleController, 'title'),
          _titleText('Type of annonce'),

          /// Range Sliders

          _titleText('Price DH'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MIN',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                Text(
                  'Max',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: _textFormFieldFunctionIcon(minPriceController, 'Min')),
              Expanded(
                  flex: 1,
                  child: _textFormFieldFunctionIcon(maxPriceController, 'Max')),
            ],
          ),
          RangeSlider(
            values: rangevalues,
            activeColor: Colors.yellow[700],
            inactiveColor: Colors.black38,
            min: 1.0,
            max: 9999999.0,
            // values: values,
            onChanged: (values) {
              setState(() {
                rangevalues = values;
                minPriceController.text = rangevalues.start.toInt().toString();
                maxPriceController.text = rangevalues.end.toInt().toString();
              });
            },
            // value: rangevalues,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (Provider.of<AllpProviders>(context, listen: false)
                      .subcetagory!
                      .isEmpty) {
                  } else if (Provider.of<AllpProviders>(context, listen: false)
                      .subcetagory!
                      .isNotEmpty) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => FiltersScreen2()));
                  }
                },
                child: Text('Apply Filters'),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 50), primary: Color(0xffF8B800)),
              ))
        ]),
      ),
    );
  }
}
