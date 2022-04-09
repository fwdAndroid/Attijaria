  import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AllpProviders extends ChangeNotifier{
  List? imageUrls=List.filled(8, null,growable: true);
  String? cetagory;
  String? subcetagory;
void setImages(int index, XFile? images){
  imageUrls![index]=images;
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