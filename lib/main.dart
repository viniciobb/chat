import 'package:flutter/material.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat/RandomWords/RandomWordsList.dart';
import 'package:chat/Loading/Loading.dart';
import 'package:chat/AddUser/AddUser.dart';
import 'package:chat/SomethingWrong/SomethingWrong.dart';

void main() => runApp(RandomWordsApp());


class App extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return RandomWordsApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}



class RandomWordsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
    ),
      home: RandomWordsApp(),
    );
  }
}// Myapp









