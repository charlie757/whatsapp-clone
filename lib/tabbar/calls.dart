import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/ChatModal1.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/data.dart';
import 'package:whatsapp_clone/tabbar/callCard.dart';

class call extends StatelessWidget {
  const call({Key key, this.chatModal1}) : super(key: key);
  final ChatModal1 chatModal1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          onPressed: () {},
          child: Icon(Icons.add_call),
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(top: 5),
            itemCount: numberlist.length,
            itemBuilder: (context, index) {
              return callCard(
                chatmodal1: numberlist[index],
              );
            }));
  }
}
