  import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AllpProviders extends ChangeNotifier{
  List? imageUrls=<XFile>[];
  String? cetagory;
  String? subcetagory;
void setImages(List? images){
  imageUrls=images;
  notifyListeners();
}
void setCetagory(String value){
  cetagory=value;
  notifyListeners();
}
void setSubCetagory(String value){
  subcetagory=value;
  notifyListeners();
}
}