import 'package:chatting_app_flutter/pages/chatpage.dart';
import 'package:chatting_app_flutter/pages/forgotpassword.dart';
import 'package:chatting_app_flutter/pages/home.dart';
import 'package:chatting_app_flutter/pages/signin.dart';
import 'package:chatting_app_flutter/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase.initializeApp();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chatting app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SignUp());
  }
}
