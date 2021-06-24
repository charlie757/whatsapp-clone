import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/data.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/number.dart';
import 'package:whatsapp_clone/popups%20screens/newGroup.dart';

import 'buttonforchat.dart';

class chatnumberlist extends StatefulWidget {
  @override
  _chatnumberlistState createState() => _chatnumberlistState();
}

class _chatnumberlistState extends State<chatnumberlist> {
  @override
  Widget build(BuildContext context) {
    var dummylist1 =
        List.generate(numberlist.length, (index) => numberlist[index]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Select contact"),
          actions: [
            IconButton(
              onPressed: () {},
              splashRadius: 25,
              icon: Icon(Icons.search),
            ),
            PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: Text(
                        "Invite a friend",
                        style: TextStyle(color: Colors.white),
                      )),
                      PopupMenuItem(
                          child: Text("Contacts",
                              style: TextStyle(color: Colors.white))),
                      PopupMenuItem(
                          child: Text("Refresh",
                              style: TextStyle(color: Colors.white))),
                      PopupMenuItem(
                          child: Text("Help",
                              style: TextStyle(color: Colors.white))),
                    ])
          ],
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: dummylist1.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => newGroup()));
                    },
                    child: button(icon: Icons.group, name: "New Group"));
              } else if (index == 1) {
                return button(
                    icon: Icons.person_add,
                    name: "New Contact",
                    icon1: Icons.qr_code);
              } else {
                return number1(
                  chatmodal1: dummylist1[index - 2],
                );
              }
            }));
  }
}
