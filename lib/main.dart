import 'package:flutter/material.dart';
import 'package:networking_app/network/delete_app.dart';
import 'package:networking_app/network/future_builder_app.dart';
import 'package:networking_app/network/get_app.dart';
import 'package:networking_app/network/post_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilderApp(),
    );
  }
}
