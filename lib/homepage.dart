import 'package:flutter/material.dart';
import 'package:whatsapp_clone/EmailVerfication/email.dart';
import 'package:whatsapp_clone/tabbar/calls.dart';
import 'package:whatsapp_clone/tabbar/camera.dart';
import 'package:whatsapp_clone/tabbar/chat.dart';
import 'package:whatsapp_clone/tabbar/status.dart';

import 'popups screens/popMenuBar.dart';

class homepage extends StatefulWidget {
  var cameras;
  homepage(this.cameras);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  TabController tb;

  void initState() {
    tb = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  bool isAvailable = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("WhatsApp Clone"),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => email()));
              }),
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/group');
                            },
                            child: Text(
                              "New group",
                            ))),
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/broad');
                            },
                            child: Text(
                              "New broadcast",
                            ))),
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/web');
                            },
                            child: Text(
                              "WhatsApp Web",
                            ))),
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/starred');
                            },
                            child: Text(
                              "Starred messages",
                            ))),
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/payments');
                            },
                            child: Text(
                              "Payments",
                            ))),
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/setting');
                            },
                            child: Text(
                              "Settings",
                            ))),
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => email()));
                            },
                            child: Text(
                              "Email",
                            )))
                  ])
        ],
        bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4.0,
            unselectedLabelColor: isAvailable ? Colors.white : Colors.white30,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            controller: tb,
            tabs: [
              Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              Text(
                "CHAT",
                style: TextStyle(fontSize: 16),
              ),
              Text("STATUS", style: TextStyle(fontSize: 16)),
              Text("CALLS", style: TextStyle(fontSize: 16))
            ]),
      ),
      body: TabBarView(
        physics: ScrollPhysics(),
        children: [camera(), chat(), status(), call()],
        controller: tb,
      ),
    );
  }
}
