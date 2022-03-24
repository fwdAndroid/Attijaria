import 'dart:io';

import 'package:attijaria/Providers/allproviders.dart';
import 'package:attijaria/separaterpages/categoriesselector.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageSelector extends StatefulWidget {
  const ImageSelector({Key? key}) : super(key: key);

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  String? imageLink;

  final ImagePicker _picker = ImagePicker();

  void addImage() async {
    final List<XFile>? image = await _picker.pickMultiImage();
    Provider.of<AllpProviders>(context, listen: false).setImages(image);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Upload Images'),
        ),
        backgroundColor: Colors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Card(
                  margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                  elevation: 10,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [Container(
                           
                           margin: EdgeInsets.only(right: 20),
                           child: Icon(Icons.cancel))]),
                       Text('Insert Images'),
                       SizedBox(height: 10,),
                       Text('Continue Inserting')
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20,left: 20),
                  child:Text(
                    'Photos (8 maximum)',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
           
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 20),
                    child: InkWell(
                      onTap: addImage,
                      child: Container(
                        height: 100,
                        width: 100,
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.amber,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.amber
                    )
                  ),
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Provider.of<AllpProviders>(context, listen: true)
                        .imageUrls!
                        .length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.all(3),
                          child: Image.file(  
                            File(        
                              Provider.of<AllpProviders>(context)
                                  .imageUrls?[index]
                                  .path,),fit: BoxFit.cover,),height: 100,width: 100,);
                    }),
              ),
              Spacer(),
              Center(
                child: Container(
                  
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        print(Provider.of<AllpProviders>(context, listen: false)
                            .imageUrls);
                        if (Provider.of<AllpProviders>(context, listen: false)
                            .imageUrls!
                            .isEmpty) {
                          Customdialog().showInSnackBar("Please Images", context);
                        } else if (Provider.of<AllpProviders>(context,
                                listen: false)
                            .imageUrls!
                            .isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => CategoriesSelector()));
                        }
                      },
                      child: Text('Continue'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber, fixedSize: Size(300, 40)),
                    )),
              )
            ],
          ),
        ),
      
    );
  }
}
