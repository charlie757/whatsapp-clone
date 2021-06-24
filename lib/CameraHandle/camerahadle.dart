import 'dart:math';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_clone/CameraHandle/cameraView.dart';
import 'package:whatsapp_clone/CameraHandle/videoView.dart';

List<CameraDescription> cameras;

class camerascreen extends StatefulWidget {
  const camerascreen({Key key}) : super(key: key);

  @override
  _camerascreenState createState() => _camerascreenState();
}

class _camerascreenState extends State<camerascreen> {
  CameraController _cameraController;

  Future<void> cameravalue;
  bool isRecording = false;
  String videoPath = '';
  bool Flash = false;
  bool isCameraFront = true;
  double transform = 0;
  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameravalue = _cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
                future: cameravalue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_cameraController);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(
                              Flash ? Icons.flash_on : Icons.flash_off,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                Flash = !Flash;
                              });
                              Flash
                                  ? _cameraController
                                      .setFlashMode(FlashMode.torch)
                                  : _cameraController
                                      .setFlashMode(FlashMode.off);
                            }),
                        GestureDetector(
                            onLongPress: () async {
                              await _cameraController.startVideoRecording();

                              setState(() {
                                isRecording = true;
                              });
                            },
                            onLongPressUp: () async {
                              XFile videoPath =
                                  await _cameraController.stopVideoRecording();
                              setState(() {
                                isRecording = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) =>
                                          videoView(path: videoPath.path)));
                            },
                            child: isRecording
                                ? Icon(
                                    Icons.radio_button_on_outlined,
                                    color: Colors.red,
                                    size: 80,
                                  )
                                : Icon(
                                    Icons.panorama_fish_eye,
                                    color: Colors.white,
                                    size: 70,
                                  ),
                            onTap: () {
                              takePhoto(context);
                            }),
                        IconButton(
                            icon: Transform.rotate(
                                angle: transform,
                                child: Icon(
                                  Icons.flip_camera_ios,
                                  color: Colors.white,
                                  size: 25,
                                )),
                            onPressed: () async {
                              setState(() {
                                isCameraFront = !isCameraFront;
                                transform = transform + pi;
                              });
                              int cameraPause = isCameraFront ? 0 : 1;
                              _cameraController = CameraController(
                                  cameras[cameraPause], ResolutionPreset.high);
                              cameravalue = _cameraController.initialize();
                            })
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Hold for video, Tap for photo",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  takePhoto(BuildContext context) async {
    final path =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile picture = await _cameraController.takePicture();
    picture.saveTo(path);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => cameraView(
                  path: path,
                )));
  }
}
