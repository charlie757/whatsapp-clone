import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/CameraHandle/camerahadle.dart';
import 'package:whatsapp_clone/tabbar/writerscreenpage.dart';

class status extends StatefulWidget {
  @override
  _statusState createState() => _statusState();
}

class _statusState extends State<status> {
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
  String img1 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNICBfe_1tgmsn15zY-RMDsXLvPnICn0E6UQ&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              mini: true,
              heroTag: null,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => writepage()));
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.edit,
                color: Colors.black,
              )),
          SizedBox(height: 15),
          FloatingActionButton(
              backgroundColor: Colors.greenAccent,
              heroTag: null,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => camerascreen()));
              },
              child: Icon(Icons.camera_alt)),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: InkWell(
              onTap: getImage,
              child: Stack(
                children: [
                  _image == null
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
                        ),
                  Container(
                    margin: EdgeInsets.only(top: 35, left: 35),
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 10,
                      child: ClipOval(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                    ),
                  )
                ],
              ),
            ),
            title: Text(
              "My status",
            ),
            subtitle: Text("Tap to add status update"),
          ),
          Container(
            height: 30,
            padding: EdgeInsets.only(left: 15),
            color: Colors.black12,
            alignment: Alignment.centerLeft,
            child: Text("Recent updates"),
          ),
          status(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNICBfe_1tgmsn15zY-RMDsXLvPnICn0E6UQ&usqp=CAU',
              'Ravi')
        ],
      ),
    );
  }

  Widget status(String video, String title) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed('/story');
      },
      leading: CircleAvatar(
        radius: 28,
        child: ClipOval(
          child: Image.network(
            video,
            fit: BoxFit.cover,
            width: 100,
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text("Today, 20:16 PM"),
    );
  }
}
