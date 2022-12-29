import 'dart:convert';

import 'package:elearningfitria/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://63ad1258da81ba97619252b9.mockapi.io/blog/blog';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
