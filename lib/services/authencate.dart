import 'package:chatting_app_flutter/pages/signin.dart';
import 'package:chatting_app_flutter/pages/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(
        toggleView: toggleView,
      );
    } else {
      return SignUp();
    }
  }
}
