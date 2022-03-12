import 'package:attijaria/separaterpages/categoriesselector.dart';
import 'package:flutter/material.dart';

class ImageSelector extends StatefulWidget {
  const ImageSelector({ Key? key }) : super(key: key);

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
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
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                                          itemCount: 4,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3),
                                          itemBuilder: (context, index) {
                                            return  Container(
                                                    margin: EdgeInsets.all(3),
                                                   child: Image.asset('asset/cameraimage.jpeg')
                                                  );
                                          }),
                   
                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (builder) => CategoriesSelector()));
                      }, child: Text('Continue'),style: ElevatedButton.styleFrom(primary: Colors.amber,fixedSize: Size(300, 70)),))
                  ],
                ),
              ),
          
       

                      
        
      ),
    );
  }
}