import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class story extends StatefulWidget {
  @override
  _storyState createState() => _storyState();
}

class _storyState extends State<story> {
  final _storycontroller = StoryController();
  String img1 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1qpcOt4X7B_VOu0A6N_yo9IB5OrznUThokQ&usqp=CAU';
  String img2 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEeolBS4YfatH5Mt9VPwhbTgluv_Agq7n7mg&usqp=CAU';
  String img3 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk7hUQOiHgYOiWK-YPZIG67aA99rnHycuL1g&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text(
          title: "Hi I am Ravi",
          textStyle: TextStyle(fontSize: 25),
          backgroundColor: Colors.red),
      StoryItem.pageImage(url: img2, controller: controller),
      StoryItem.pageImage(url: img1, controller: controller),
      StoryItem.pageVideo(
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.gfycat.com%2FVariableBlankCollie-max-1mb.gif&imgrefurl=https%3A%2F%2Fgfycat.com%2Fgifs%2Fsearch%2Fenglish%2Bsong&tbnid=rONwxWh0loUj1M&vet=12ahUKEwie7PiSmKTxAhX2gksFHU0HAUoQMygEegUIARDuAQ..i&docid=NQZpyPNyX2Hx3M&w=444&h=250&q=gif%20video%20in%20english%20songs&hl=en-GB&ved=2ahUKEwie7PiSmKTxAhX2gksFHU0HAUoQMygEegUIARDuAQ',
          controller: controller)
    ];
    return Material(
      child: StoryView(
        storyItems: storyItems,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}
