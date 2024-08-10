import 'dart:convert';

import 'package:http/http.dart' as http;
const api_url = "http://127.0.0.1:8000/api";

sendPost(url, body) async {
  var result = null;
  await http.post(Uri.parse(url), 
      headers: {"Content-Type": "application/json"}, body: body)
      .then((res) {
        print(res.body);
        result = res;
      }).catchError((err) {
        print(err);
        result = err;
      });
  return result;
}

sendGet(url) async {
  var result = null;
  await http.get(Uri.parse(url), 
      headers: {"Content-Type": "application/json"})
      .then((res) {
        print(res.body);
        result = jsonDecode(res.body);
        
      }).catchError((err) {
        print(err);
        result = err;
      });

  return result;
}