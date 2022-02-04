import 'package:attijaria/Utils/constant.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retTypepasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                'Change Password',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              width: 320,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: oldpasswordController,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Enter Old Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.yellow,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xffF8B800), width: 2),
                  ),
                ),
              ),
            ),
            Container(
              width: 320,
              padding: EdgeInsets.all(10.0),
              child: TextField(
  controller: passwordController,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Enter New Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.yellow,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xffF8B800), width: 2),
                  ),
                ),
              ),
            ),
            Container(
              width: 320,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: retTypepasswordController,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Retype New Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.yellow,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xffF8B800), width: 2),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  fixedSize: Size(343, 64),
                  primary: Color(0xffF8B800),
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                ),
                onPressed: ()async {
                  if (oldpasswordController.text.isEmpty) {
                    Customdialog().showInSnackBar("required Old Password", context);
                  }
                 else if (passwordController.text.isEmpty) {
                    Customdialog().showInSnackBar("required New Password", context);
                  }
                  else if (retTypepasswordController.text.isEmpty) {
                    Customdialog().showInSnackBar("required Retype Password", context);
                  }

                  else if(oldpasswordController.text.isNotEmpty&&passwordController.text.isNotEmpty&&retTypepasswordController.text.isNotEmpty){
                    Customdialog.showDialogBox(context);
                    try {
                      User firebaseUser = await firebaseAuth.currentUser!;
                      var result = await firebaseUser.reauthenticateWithCredential(
                          EmailAuthProvider.credential(email: firebaseUser.email!,
                              password: oldpasswordController.text.trim()));
                     await result.user!.updatePassword(passwordController.text.trim()).then((value){
                       Navigator.pop(context);
                           Navigator.pop(context);
                           Customdialog().showInSnackBar(
                               "Password Successfully updated", context);

                     }).catchError((e){
                       throw e;
                     });

                    } on FirebaseAuthException catch (e) {
                      Navigator.pop(context);
                      Customdialog.showBox(context, e.toString());
                    }
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
