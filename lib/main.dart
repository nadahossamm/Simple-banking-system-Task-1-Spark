import 'package:flutter/material.dart';
import 'package:task1spark/Layout/MainPage.dart';

import 'Database/db.dart';

void main() {

  runApp(const MyApp());
  createDatabase();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:HomePage(

      ),

    );
  }
}

