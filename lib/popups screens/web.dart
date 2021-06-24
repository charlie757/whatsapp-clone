import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class whatsappWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp Web"),
        ),
        body: ListView(
          children: [
            Container(
                child: Material(
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6Yx0tlIX_gZH5aN8hEDmZiJXStJL8Z8ymOw&usqp=CAU',
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Container(
                      // color: Colors.green,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Use WhatsApp on other devices",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.green,
                      child: Text(
                        "LINK A DEVICE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Material(
                elevation: 10,
                child: Container(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DEVICE STATUS"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Tap a device to log out.",
                          style: TextStyle(color: Colors.black38))
                    ],
                  ),
                ))
          ],
        ));
  }
}
