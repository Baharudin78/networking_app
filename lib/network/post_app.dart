import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myHttp;

class PostApp extends StatefulWidget {
  const PostApp({Key? key}) : super(key: key);

  @override
  State<PostApp> createState() => _PostAppState();
}

class _PostAppState extends State<PostApp> {
  TextEditingController namaCont = TextEditingController();
  TextEditingController jobCont = TextEditingController();

  String hasilResponse = "Belum ada data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST APP"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          TextField(
            controller: namaCont,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Name"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: jobCont,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration:
                InputDecoration(border: OutlineInputBorder(), labelText: "Job"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              var response = await myHttp.post(
                  Uri.parse("https://reqres.in/api/users"),
                  body: {"name": namaCont.text, "job": jobCont.text});
              Map<String, dynamic> data =
                  json.decode(response.body) as Map<String, dynamic>;
              setState(() {
                hasilResponse = "${data["name"]}";
              });
            },
            child: Text("Submit"),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          Text(hasilResponse),
        ],
      ),
    );
  }
}
