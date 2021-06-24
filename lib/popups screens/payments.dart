import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class payments extends StatefulWidget {
  @override
  _paymentsState createState() => _paymentsState();
}

class _paymentsState extends State<payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payments"),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) =>
                    [PopupMenuItem(child: Text("Scan QR code"))])
          ],
        ),
        body: ListView(
          children: [
            Material(
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                      child: ClipOval(
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPvON2Y2q1_PNRXmlx_V8DJpAuS26iDheSKw&usqp=CAU',
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.people_alt),
                    ),
                  )),
                  title: Text("Selena"),
                  subtitle: Text("0123456789.wa.8bp@icici"),
                  trailing: Icon(
                    Icons.qr_code,
                    color: Colors.green,
                  ),
                )),
            SizedBox(
              height: 5,
            ),
            Material(
                elevation: 10,
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text("Payment history",
                            style: TextStyle(color: Colors.green[800]))),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Icon(
                            Icons.payment_outlined,
                            color: Colors.black26,
                            size: 45,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("No payment history",
                              style: TextStyle(color: Colors.black38)),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ))),
            SizedBox(height: 5),
            Material(
                elevation: 10,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15, top: 10),
                          child: Text("Payment history",
                              style: TextStyle(color: Colors.green[800]))),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        color: Colors.greenAccent[100],
                        child: ListTile(
                          leading: Icon(Icons.security_outlined),
                          title: Text(
                            "To protect your security, WhatsAPp does not store your UPI PIN or full bank account number.",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ListTile(
                          leading: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "pay",
                                style: TextStyle(color: Colors.deepPurple)),
                            TextSpan(
                                text: "tm",
                                style: TextStyle(color: Colors.blue))
                          ])),
                          title: Text("Paytm Payments Bank **50 via UPI"),
                          subtitle: Text("Primary payment method"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                          ),
                          title: Text("Add payment method"),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
