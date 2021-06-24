import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoView extends StatefulWidget {
  const videoView({Key key, this.path}) : super(key: key);
  final String path;

  @override
  _videoViewState createState() => _videoViewState();
}

class _videoViewState extends State<videoView> {
  VideoPlayerController _controller;
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: (Icon(
                Icons.crop_16_9_rounded,
                size: 27,
              )),
              onPressed: () {}),
          IconButton(icon: Icon(Icons.emoji_emotions), onPressed: () {}),
          IconButton(icon: Icon(Icons.title), onPressed: () {}),
          IconButton(icon: Icon(Icons.edit), onPressed: () {})
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Positioned(
                bottom: 0.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: Colors.black,
                  child: TextFormField(
                    maxLines: 6,
                    minLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    decoration: InputDecoration(
                        hintText: "Add Caption....",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white, fontSize: 17),
                        prefixIcon: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 27,
                        ),
                        suffixIcon: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.greenAccent[700],
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 27,
                          ),
                        )),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.greenAccent,
                    child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 50),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
