import 'package:chatting_app_flutter/pages/chatpage.dart';
import 'package:chatting_app_flutter/pages/signin.dart';
import 'package:chatting_app_flutter/services/authencate.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //AuthMethods authMethods = new AuthMethods();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/kk.png",
          height: 50,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // authMethods.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatPage(userName: "")));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search_outlined), onPressed: () {}
          //{Navigator.push(context, route)},
          ),
    );
  }
}
