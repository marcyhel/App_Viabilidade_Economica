import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plan3/screens/home.dart';

import 'mobx/mob_dados/mob_dados.dart';

void main() {
  singletonsApp();
  runApp(MyApp());
}

void singletonsApp() {
  GetIt.I.registerSingleton(Mob_dados());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
