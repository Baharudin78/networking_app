import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderApp extends StatefulWidget {
  const FutureBuilderApp({Key? key}) : super(key: key);

  @override
  State<FutureBuilderApp> createState() => _FutureBuilderAppState();
}

class _FutureBuilderAppState extends State<FutureBuilderApp> {
  List<Map<String, dynamic>> allUser = [];
  Future getAllUser() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(element);
      });
      print(allUser);
    } catch (e) {
      print("terjadi kesalahan");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Future Builder')),
      body: FutureBuilder(
        future: getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading..."),
            );
          } else {
            return ListView.builder(
              itemCount: allUser.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(allUser[index]['avatar']),
                ),
                title: Text(
                    "${allUser[index]['first_name']} ${allUser[index]['last_name']}"),
                subtitle: Text("${allUser[index]['email']}"),
              ),
            );
          }
        },
      ),
    );
  }
}
