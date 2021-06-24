import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class setting extends StatefulWidget {
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String img =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPvON2Y2q1_PNRXmlx_V8DJpAuS26iDheSKw&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: [
            SizedBox(height: 15),
            ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/profilepic');
                },
                leading: InkWell(
                    onTap: getImage,
                    child: _image == null
                        ? CircleAvatar(
                            radius: 28,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                imageUrl: img,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.people_alt),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 28,
                            child: ClipOval(
                              child: Image.file(
                                _image,
                                fit: BoxFit.cover,
                                height: height,
                                width: width,
                              ),
                            ),
                          )),
                title: Text("Selena"),
                subtitle: Text(
                  "I don't need your attitude I have one of my own",
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/scancode');
                  },
                  child: Icon(Icons.qr_code),
                )),
            Divider(
              thickness: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("Account"),
              subtitle: Text("Privacy, security, change, number"),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text("Chats"),
              subtitle: Text("Theme, wallpapers, chat history"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              subtitle: Text("Message, group & calls tones"),
            ),
            ListTile(
              leading: Icon(Icons.download_outlined),
              title: Text("Storage and data"),
              subtitle: Text("Network usage, auto-download"),
            ),
            ListTile(
              leading: Icon(Icons.help_rounded),
              title: Text("Help"),
              subtitle: Text("Help center, contact us, privacy policy"),
            ),
            Divider(
              indent: 70,
            ),
            ListTile(
                leading: Icon(Icons.people_alt),
                title: Text("Invite a friend")),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Text("from", style: TextStyle(fontSize: 12)),
                    Text("FACEBOOK", style: TextStyle(fontSize: 18)),
                  ],
                )),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
