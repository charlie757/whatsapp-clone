import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsapp_clone/ChatModalData/chatmodal.dart';
import 'package:whatsapp_clone/ChatModalData/data.dart';

import 'charcard.dart';

class chat extends StatefulWidget {
  const chat({
    Key key,
  }) : super(key: key);

  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    // var dummylist = List.generate(chats.length, (index) => chats[index]);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/chatnumber');
          },
          backgroundColor: Colors.greenAccent,
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext, index) => chatcard(
                  chatmodal: chats[index],
                )));
  }
}
