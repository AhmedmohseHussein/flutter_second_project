import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHandler {
  String url = 'https://jsonplaceholder.typicode.com/photos';

  Future fetchData() async {
    final respond = await http.get(Uri.parse(url));
    if (respond.statusCode == 200) {
      String data0 = respond.body;
      var data = jsonDecode(respond.body);
      print(data.toString());
    } else {
      throw Exception('${respond.statusCode}');
    }
  }
}
