import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

List post = [];

class ApiTest extends StatefulWidget {
  const ApiTest({super.key});

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  Future getPosts() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    http.Response respons = await http.get(Uri.parse(url));
    List responsBody = jsonDecode(respons.body).toString().split('},');
    setState(() {
      post.addAll(responsBody);
    });

    // return responsBody;
  }

  addPost() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response =
        await http.post(Uri.parse(url), body: {'title': 'foo'});
    var responsBody = jsonDecode(response.body);
    print(responsBody);
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getPosts(),
      initialData: [],
      builder: (context, snapshot) {
        return Container(
            child: ListView.builder(
          itemCount: post.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text("${snapshot.data[i]}"),
            );
          },
        ));
      },
    ));
  }
}
