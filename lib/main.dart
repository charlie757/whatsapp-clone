import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/CameraHandle/camerahadle.dart';
import 'package:whatsapp_clone/Contact%20Number%20List/number.dart';
import 'package:whatsapp_clone/SettingFolder/profilepic.dart';
import 'package:whatsapp_clone/SettingFolder/scanQR.dart';
import 'package:whatsapp_clone/homepage.dart';
import 'package:whatsapp_clone/message.dart';
import 'package:whatsapp_clone/popups%20screens/newBroad.dart';
import 'package:whatsapp_clone/popups%20screens/newGroup.dart';
import 'package:whatsapp_clone/popups%20screens/payments.dart';
import 'package:whatsapp_clone/popups%20screens/setting.dart';
import 'package:whatsapp_clone/popups%20screens/starred.dart';
import 'package:whatsapp_clone/popups%20screens/web.dart';
import 'package:whatsapp_clone/tabbar/calls.dart';
import 'package:whatsapp_clone/tabbar/camera.dart';
import 'package:whatsapp_clone/tabbar/chat.dart';
import 'package:whatsapp_clone/tabbar/chatnumberlist.dart';
import 'package:whatsapp_clone/tabbar/status.dart';
import 'package:whatsapp_clone/tabbar/story.dart';
import 'package:whatsapp_clone/theme.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // final firstCamera = cameras.first;
  // Future.delayed(Duration(seconds: 5));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/message': (context) => message(),
          '/camera': (context) => camera(),
          '/call': (context) => call(),
          '/chat': (context) => chat(),
          '/chatnumber': (context) => chatnumberlist(),
          '/status': (context) => status(),
          '/story': (context) => story(),

          /// POPMENU BUTTON SCREENS
          '/setting': (context) => setting(),
          '/broad': (context) => newboradcast(),
          '/group': (context) => newGroup(),
          '/payments': (context) => payments(),
          '/starred': (context) => starred(),
          '/web': (context) => whatsappWeb(),

          /////SETTING FLODER SCREENS
          '/profilepic': (context) => profilepic(),
          '/scancode': (context) => scanQR(),

          ///CONTACT NUMBER LIST
          '/number': (context) => number1()
        },
        title: 'Flutter Demo',
        theme: myTheme.darkTheme(context),
        home: homepage(cameras));
  }
}
