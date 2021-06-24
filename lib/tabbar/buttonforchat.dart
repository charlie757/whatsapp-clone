import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button({Key key, this.name, this.icon, this.icon1}) : super(key: key);

  final String name;
  final IconData icon;
  final IconData icon1;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.greenAccent,
        child: ClipOval(
          child: Icon(icon,color: Colors.white,),
        ),
      ),
      title: Text(name),
      trailing: Icon(icon1),
    );
  }
}
