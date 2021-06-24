import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class writepage extends StatelessWidget {
  const writepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: TextField(
        scrollPadding: EdgeInsets.all(20),
        keyboardType: TextInputType.multiline,
        maxLines: 99999,
        minLines: 1,
        autofocus: true,
        cursorHeight: 60,
        autocorrect: true,
        mouseCursor: MouseCursor.uncontrolled,
        decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            border: InputBorder.none,
            hintText: "Type a status",
            hintStyle: TextStyle(fontSize: 25)),
      ),
    ));
  }
}
