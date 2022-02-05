import 'package:flutter/material.dart';

import 'constant.dart';

class SaveUtils{
  void saveData({String? price,String? type,String? cetagory,String? subcetagory,String? title,String? description,String? imageUrl  }){
    firebaseFirestore.collection('cetagories').add({
 'imageUrl':imageUrl ,
 'price':price,
      'cetagory' :cetagory,
      'subcetagory':subcetagory
      , 'title':title,
 'description':description,
      'isActive':true,
      'fav':false

    }).catchError((e){
      print(e);
    });
  }
  void updateData({String? price,String? cetagory,
    String? subcetagory,String? title,String? description,String? imageUrl  ,required String docid }){
    firebaseFirestore.collection('cetagories').doc(docid).update({
      'imageUrl':imageUrl ,
      'price':price,
      // 'type':type,
      'cetagory' :cetagory,
      'subcetagory':subcetagory,
      'title':title,
      'description':description,
   'isActive':true,
      'fav':false
    }).catchError((e){
      print(e);
    });
  }
  void addCetagories({String? cetagory,String? subcetagory}){
   if(cetagory=="" || subcetagory==""){
   }
   else{
     firebaseFirestore.collection('cetagory').add({
       'cetagory':cetagory?.toLowerCase() ,
       'subcetagory':subcetagory?.toLowerCase(),

     }).catchError((e){
       print(e);
     });
   }
  }
  void updateCetagories({String? cetagory,String? subcetagory,String? docid}){
    if(cetagory=="" || subcetagory==""){
    }
    else{
      firebaseFirestore.collection('cetagory').doc(docid).update({
        'cetagory':cetagory?.toLowerCase() ,
        'subcetagory':subcetagory?.toLowerCase(),

      }).catchError((e){
        print(e);
      });
    }
  }
}
