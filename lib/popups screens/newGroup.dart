import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/ChatModal1.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/data.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/number.dart';
import 'package:whatsapp_clone/tabbar/chatnumberlist.dart';

class newGroup extends StatefulWidget {
  @override
  _newGroupState createState() => _newGroupState();
}

class _newGroupState extends State<newGroup> {
  List<ChatModal1> groups = [];

  BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("New group", style: TextStyle()),
              SizedBox(height: 5),
              Text("Add participants", style: TextStyle(fontSize: 12))
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
        body: Stack(
          children: [
            ListView.builder(
                itemCount: numberlist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (numberlist[index].select == false) {
                        setState(() {
                          numberlist[index].select = true;
                          groups.add(numberlist[index]);
                        });
                      } else {
                        setState(() {
                          numberlist[index].select = false;
                          groups.remove(numberlist[index]);
                        });
                      }
                    },
                    child: number1(
                      chatmodal1: numberlist[index],
                    ),
                  );
                }),
          ],
        ));
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
      child: Icon(Icons.arrow_forward),
    );
  }
}

void showSnackBarHandler(BuildContext context) {
  var snackBar = SnackBar(
    width: MediaQuery.of(context).size.width - 100,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    behavior: SnackBarBehavior.floating,
    content: Text("At least 1 contacts must be selected"),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
