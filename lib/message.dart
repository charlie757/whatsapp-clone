import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ChatModalData/ChatModal.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/ChatModal1.dart';

class message extends StatefulWidget {
  const message({Key key, this.chatmodal}) : super(key: key);
  final ChatModal chatmodal;

  @override
  _messageState createState() => _messageState();
}

class _messageState extends State<message> {
  bool show = false;
  FocusNode focusMode = FocusNode();
  bool sendButton = false;
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
            splashRadius: 20,
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
            splashRadius: 20,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            splashRadius: 20,
          )
        ],
      ),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                    width: width - 55,
                    child: Card(
                        margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                                hintText: "Type a message",
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                    icon: Icon(Icons.emoji_emotions_outlined),
                                    onPressed: () {}),
                                contentPadding: EdgeInsets.all(5),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.attach_file),
                                        onPressed: () {}),
                                    IconButton(
                                        icon: Icon(Icons.camera_alt),
                                        onPressed: () {})
                                  ],
                                )),
                          ),
                        )),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 8, right: 5),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFF128C7E),
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
