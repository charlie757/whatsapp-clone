import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ChatModalData/chatmodal.dart';
import 'package:whatsapp_clone/message.dart';

class chatcard extends StatelessWidget {
  const chatcard({Key key, this.chatmodal}) : super(key: key);
  final ChatModal chatmodal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => message()));
        },
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  radius: 28,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      imageUrl: chatmodal.img,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.people_alt),
                    ),
                  )),
              title: Text(
                chatmodal.name,
              ),
              subtitle: Text(chatmodal.status),
              trailing: Text(chatmodal.time),
            ),
            Divider(
              indent: 80,
            )
          ],
        ));
  }
}
