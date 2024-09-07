import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../model/post_model.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier {
  List<PostModel> postList = [];

  Future<List<PostModel>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
}
