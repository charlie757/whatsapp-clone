import 'package:cached_network_image/cached_network_image.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

class email extends StatefulWidget {
  const email({Key key}) : super(key: key);

  @override
  _emailState createState() => _emailState();
}

class _emailState extends State<email> {
  String img1 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNICBfe_1tgmsn15zY-RMDsXLvPnICn0E6UQ&usqp=CAU';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _otpcontroller = TextEditingController();

  bool submitValid = false;
  void sendOTP() async {
    EmailAuth.sessionName = 'Text Session';
    bool res =
        await EmailAuth.sendOtp(receiverMail: _emailController.value.text);
    if (res) {
      print("OTP sent");
    } else {
      print("could not sent the OTP");
    }
  }

  bool verifyOTP() {
    var res = EmailAuth.validate(
        receiverMail: _emailController.value.text,
        userOTP: _otpcontroller.value.text);
    if (res) {
      print("OTP verified");
    } else {
      print("Invalid OTP");
    }
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Email Verify"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: img1,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.people_alt),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        suffix: TextButton(
                            onPressed: () => sendOTP(),
                            child: Text("SEND OTP"))),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _otpcontroller,
                    decoration: InputDecoration(hintText: "Enter OTP"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () => verifyOTP(),
                    color: Colors.green,
                    child: Text(
                      "verify OTP",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
