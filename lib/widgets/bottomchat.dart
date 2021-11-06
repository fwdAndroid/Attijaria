import 'package:flutter/material.dart';

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
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              focusNode: _focusNode,
              decoration: InputDecoration(
                labelText: 'Write A Message',
                border: InputBorder.none,
              ),
            )),
            IconButton(
                icon: Icon(Icons.send, color: Color(0xffF8B800)),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: Color(0xffF8B800),
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
