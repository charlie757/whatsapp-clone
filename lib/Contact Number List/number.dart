import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ChatModalData/ChatModal.dart';

import 'ChatModal1.dart';

class number1 extends StatelessWidget {
  const number1({Key key, this.chatmodal1}) : super(key: key);
  final ChatModal1 chatmodal1;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chatmodal1.name),
      leading: Container(
          height: 53,
          width: 50,
          child: Stack(
            children: [
              CircleAvatar(
                // radius: 22,
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    imageUrl: chatmodal1.img,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.people_alt),
                  ),
                ),
              ),
              chatmodal1.select
                  ? Positioned(
                      bottom: 4,
                      right: 5,
                      child: CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 10,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          )))
                  : Container()
            ],
          )),
      subtitle: Text(chatmodal1.status),
    );
  }
}
