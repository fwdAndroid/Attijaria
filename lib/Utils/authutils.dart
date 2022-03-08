import 'package:attijaria/screens/Home/homepage.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'constant.dart';


class AuthUtils{

   registerUser(
      String userName,
      String email,
      String password,
       String dob,
       String gender,
       String phoneNumber,
       String imageLink,
       BuildContext context
      )async{
  try{
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).set({
        "id":firebaseAuth.currentUser!.uid,
        'UserName':userName,
        'Email':email,
        "DOB":dob,
        "Gender":gender,
        "Phone Number":phoneNumber
,"imageLink":imageLink,
      "status":"offline"  // 'Password':password
      }).then((value) {
        Customdialog().showInSnackBar("Logged in", context);
        // Provider.of<CircularProgressProvider>(context,listen: false).setValue(false);
        Customdialog.closeDialog(context);
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => HomePage()), (
            route) => false);
      });
    }  ).catchError((onError){
      throw onError;

    });
  }on FirebaseAuthException catch(e){
    Navigator.pop(context);

    Customdialog.showBox(context,e.toString());


  }
  }
   loginUser(
       String email,
       String password,
       BuildContext context
       )async{
try{
  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) {
    firebaseFirestore.collection('users').where('Email',isEqualTo: email).where('Password',isEqualTo: password)
        .get().then((value) {
      Customdialog().showInSnackBar("Logged in", context);
      // Provider.of<CircularProgressProvider>(context,listen: false).setValue(false);
      Customdialog.closeDialog(context);
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (_) => HomePage()), (
          route) => false);
    });
  }  ).catchError((onError){
    throw onError;
  });
}
catch(e){
Navigator.pop(context);
  Customdialog.showBox(context,e.toString());
}
   }
   Future<UserCredential> signInWithGoogle() async {

     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();


     final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;


     final credential = GoogleAuthProvider.credential(
       accessToken: googleAuth.accessToken,
       idToken: googleAuth.idToken,
     );


     return await FirebaseAuth.instance.signInWithCredential(credential);
   }

   Future<UserCredential> facbookLogin()async{
     final LoginResult result = await FacebookAuth.instance.login();
     final AuthCredential facebookCredential =
     FacebookAuthProvider.credential(result.accessToken!.token);
     return
       await FirebaseAuth.instance.signInWithCredential(facebookCredential);
   }
   socialLoginUser(
       BuildContext context
       )async{
     String userName=firebaseAuth.currentUser!.displayName.toString();
         String email=firebaseAuth.currentUser!.email.toString();
     String dob="";
     String gender="";
     String phoneNumber=firebaseAuth.currentUser!.phoneNumber.toString();
     String imageLink=firebaseAuth.currentUser!.photoURL.toString();
     try{

       await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).set({
         "id":firebaseAuth.currentUser!.uid,
         'UserName':userName,
           'Email':email,
           "DOB":dob,
           "Gender":gender,
           "Phone Number":phoneNumber,
         "imageLink":imageLink
,
         "status":"offline"// 'Password':password
         }).then((value) {
           Customdialog().showInSnackBar("Logged in", context);
           // Provider.of<CircularProgressProvider>(context,listen: false).setValue(false);
           Customdialog.closeDialog(context);
           Navigator.pushAndRemoveUntil(
               context, MaterialPageRoute(builder: (_) => HomePage()), (
               route) => false);

     });
     }on FirebaseAuthException catch(e){
       Navigator.pop(context);

       Customdialog.showBox(context,e.toString());


     }
   }
}