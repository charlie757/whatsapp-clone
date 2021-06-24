import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/ChatModal1.dart';

class callCard extends StatelessWidget {
  const callCard({Key key, this.chatmodal1}) : super(key: key);
  final ChatModal1 chatmodal1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: Text(chatmodal1.name),
            leading: CircleAvatar(
              radius: 28,
              child: ClipOval(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  imageUrl: chatmodal1.img,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.people_alt),
                ),
              ),
            ),
            trailing: Icon(Icons.call, color: Colors.greenAccent)),
        Divider(
          indent: 80,
        )
      ],
    );
  }
}
