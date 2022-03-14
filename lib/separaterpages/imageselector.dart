import 'dart:io';

import 'package:attijaria/Providers/allproviders.dart';
import 'package:attijaria/separaterpages/categoriesselector.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageSelector extends StatefulWidget {
  const ImageSelector({ Key? key }) : super(key: key);

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  String? imageLink;

  final ImagePicker _picker = ImagePicker();

  void addImage() async {
    final List<XFile>? image = await _picker.pickMultiImage();
      Provider.of<AllpProviders>(context,listen: false).setImages(image);

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Upload Images'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body:   
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    Container(
                      
                      margin: EdgeInsets.only(top: 20),
                      child: Center(child: Text('Chose Atleast Eight Images',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),))),
                    Spacer(),
                    InkWell(
                      onTap: addImage,
                      child: Container(
                          margin: EdgeInsets.all(3),
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.amber,),
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                          child: Icon(Icons.add_a_photo,color: Colors.white,size: 30,)
                      ),
                    ),
                    GridView.builder(
                      physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                                          itemCount: Provider.of<AllpProviders>(context,listen: true).imageUrls!.length,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3),
                                          itemBuilder: (context, index) {
                                            return  Container(
                                                    margin: EdgeInsets.all(3),
                                                   child:Image.file(
                                                       File(Provider.of<AllpProviders>(context).imageUrls?[index].path))
                                                  );
                                          }),
                   
                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(onPressed: (){
                        print(Provider.of<AllpProviders>(context,listen: false).imageUrls);
if(Provider.of<AllpProviders>(context,listen: false).imageUrls!.isEmpty){
  Customdialog().showInSnackBar("Please Images", context);
}
else if(Provider.of<AllpProviders>(context,listen: false).imageUrls!.isNotEmpty){
  Navigator.push(context, MaterialPageRoute(builder: (builder) => CategoriesSelector()));
}
                      }, child: Text('Continue'),style: ElevatedButton.styleFrom(primary: Colors.amber,fixedSize: Size(300, 70)),))
                  ],
                ),
              ),
          
       

                      
        
      ),
    );
  }
}