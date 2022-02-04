import 'package:attijaria/Utils/constant.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Change Email',
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
                  'Change Email',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 320,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: passwordController,
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    suffixIcon: Icon(
                      Icons.email,
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
                      borderSide:
                          BorderSide(color: Color(0xffF8B800), width: 2),
                    ),
                  ),
                ),
              ),
              // Spacer(),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 320,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Enter New Email Address',
                    suffixIcon: Icon(
                      Icons.email,
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
                      borderSide:
                      BorderSide(color: Color(0xffF8B800), width: 2),
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
                    if(passwordController.text.isEmpty){
                      Customdialog().showInSnackBar("required Password", context);
                    }
                   else if(emailController.text.isEmpty){
                      Customdialog().showInSnackBar("required Email", context);
                    }
                    else if(emailController.text.isNotEmpty&passwordController.text.isNotEmpty){
                      Customdialog.showDialogBox(context);

                      try{
                        User firebaseUser = await firebaseAuth.currentUser!;
                        var result = await firebaseUser.reauthenticateWithCredential(
                            EmailAuthProvider.credential(email: firebaseUser.email!,
                                password: passwordController.text.trim()));
                        await result.user!.updateEmail(emailController.text.trim()).then((value) =>
                         firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).update({
                           "Email":emailController.text.trim()
                         }).then((value) {
                           Navigator.pop(context);
                           Navigator.pop(context);
                           Customdialog().showInSnackBar(
                               "Email Successfully updated", context);
                         }).catchError((e){
                           throw e;
                         })
                     ).catchError((e){
                       throw e;
                     });

                   }on FirebaseAuthException
                    catch(e){
                      Navigator.pop(context);
                      Customdialog.showBox(context,e.toString());
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
      ),
    );
  }
}
