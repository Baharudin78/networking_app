import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myHttp;

class GetApp extends StatefulWidget {
  const GetApp({Key? key}) : super(key: key);

  @override
  State<GetApp> createState() => _GetAppState();
}

class _GetAppState extends State<GetApp> {
  late String body = "";
  late String nama = "";
  late String email = "";
  @override
  void initState() {
    body = "Belum ada data ";
    nama = "Belum ada data ";
    email = "Belum ada data ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get request"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(body),
            SizedBox(
              height: 20,
            ),
            Text(nama),
            SizedBox(
              height: 20,
            ),
            Text(email),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                var response = await myHttp.get(
                  Uri.parse("https://reqres.in/api/users/2"),
                );
                if (response.statusCode == 200) {
                  print("Berhasil");
                  var data = jsonDecode(response.body) as Map<String, dynamic>;

                  setState(() {
                    body = data["data"].toString();
                    nama = "${data["first_name"]} ${data["last_name"]}";
                    email = data["email"].toString();
                  });
                } else {
                  print("Error");
                  response.statusCode;
                }
              },
              child: Text("Ambil data"),
            ),
          ],
        ),
      ),
    );
  }
}
