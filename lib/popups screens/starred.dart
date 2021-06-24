import 'package:flutter/material.dart';

class starred extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Starred messages"),
        actions: [
          IconButton(
              splashRadius: 20, icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton(
              itemBuilder: (context) =>
                  [PopupMenuItem(child: Text("Unstar all"))])
        ],
      ),
      body: Center(
          // child: Text("Starred messages"),
          ),
    );
  }
}
