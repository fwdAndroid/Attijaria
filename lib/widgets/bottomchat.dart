import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomChatClass extends StatefulWidget {
  const BottomChatClass({Key? key}) : super(key: key);

  @override
  _BottomChatClassState createState() => _BottomChatClassState();
}

class _BottomChatClassState extends State<BottomChatClass> {
  AnimationController? _controller;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller!.forward();
      } else {
        _controller!.reverse();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomNavBar();
  }

  Widget _buildBottomNavBar() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Container(
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(5),
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(15)),
                            color: HexColor("#9098B1"),
                          ),
                          child: Image.asset('asset/union.png')),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color(0xffF8B800),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: HexColor('#F8B800'),
                    borderRadius: BorderRadius.circular(15)),
                height: 50,
                width: 50,
                child: Icon(Icons.add, color: Colors.white),
              )
            ],
          ),
        ),
        Expanded(
          child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Color(0xffF8B800),
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}
