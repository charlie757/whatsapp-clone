import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/data.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/number.dart';

class newboradcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New broadcast", style: TextStyle()),
            Text("0 of 11 selected", style: TextStyle(fontSize: 12))
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FAB(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.all(5),
            child: Text(
              "Only contact with +9782485409 in their address book will receive your broadcast messages.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black26),
            ),
          ),
          Divider(),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 167,
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: numberlist.length,
                itemBuilder: (context, index) {
                  return number1(
                    chatmodal1: numberlist[index],
                  );
                },
              ))
        ],
      ),
    );
  }
}

class FAB extends StatelessWidget {
  const FAB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      onPressed: () {
        showSnackBarHandler(context);
      },
      child: Icon(Icons.done),
    );
  }
}

void showSnackBarHandler(BuildContext context) {
  var snackBar = SnackBar(
    width: MediaQuery.of(context).size.width - 100,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    behavior: SnackBarBehavior.floating,
    content: Text("At least 2 contacts must be selected"),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
