import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteApp extends StatefulWidget {
  const DeleteApp({Key? key}) : super(key: key);

  @override
  State<DeleteApp> createState() => _DeleteAppState();
}

class _DeleteAppState extends State<DeleteApp> {
  String data = "Belum ada data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP DELETE"),
        actions: [
          IconButton(
              onPressed: () async {
                var response = await http.get(
                  Uri.parse("https://reqres.in/api/users/2"),
                );
                if (response.statusCode == 200) {
                  print(data);
                  Map<String, dynamic> data1 =
                      json.decode(response.body) as Map<String, dynamic>;
                  setState(() {
                    data =
                        "${data1["data"]["first_name"]} ${data1["data"]["last_name"]}";
                  });
                }
              },
              icon: Icon(Icons.get_app)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        children: [
          Text(data),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              var response = await http.delete(
                Uri.parse("https://reqres.in/api/users/2"),
              );
              if (response.statusCode == 204) {
                setState(() {
                  data = "Berhasil hapus";
                });
              }
            },
            child: Text("Delete Data"),
          ),
        ],
      ),
    );
  }
}
