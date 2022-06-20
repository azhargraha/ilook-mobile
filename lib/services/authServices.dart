import 'dart:convert';
import 'package:ilook/services/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(
    String name, username, password, phoneNumber) async {
      Map data = {
        "role": "user",
        "name": name,
        "username": username,
        "password": password,
        "phoneNumber": phoneNumber,
      };
      var body = json.encode(data);
      var url = Uri.parse(baseURL+'register');
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      print(response.body);
      return response;
  }

  static Future<http.Response> login(
    String username, password) async {
      Map data = {
        "username": username,
        "password": password,
      };
      var body = json.encode(data);
      var url = Uri.parse(baseURL+'login');
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      print(response.body);
      return response;
  }
}