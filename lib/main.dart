import 'package:firebase/operation.dart';
import 'package:firebase/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBDeHEx_cf61tweulDXOt152vloTDC4bp0",
        appId: "1:923718910068:android:53ead621b861fa966f1121",
        messagingSenderId: "923718910068",
        projectId: "my-first-firebase-21626")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Signin(title: 'Hello')
    );
  }
}

