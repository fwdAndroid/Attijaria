import 'package:attijaria/Utils/constant.dart';
import 'package:attijaria/widgets/customdialog.dart';
import 'package:flutter/material.dart';

class ChangePhone extends StatefulWidget {
  const ChangePhone({Key? key}) : super(key: key);

  @override
  _ChangePhoneState createState() => _ChangePhoneState();
}

class _ChangePhoneState extends State<ChangePhone> {
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Change Phone Number',
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
                  'Change Phone Number',
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
                  controller: phoneController,
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Enter New Phone Number',
                    suffixIcon: Icon(
                      Icons.phone,
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
                  onPressed: () {
                    if(phoneController.text.isEmpty){
                      Customdialog().showInSnackBar("required Phone Number", context);
                    }
                    else{
                      Customdialog.showDialogBox(context);
                      firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).update({
                        "Phone Number":phoneController.text.trim()
                      }).then((value) {
                       Navigator.pop(context);
                       Navigator.pop(context);
                       Customdialog().showInSnackBar(
                            "Phone Number Successfully updated", context);
                      });
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
    });
  }
}
