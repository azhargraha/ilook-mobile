import 'dart:convert';
import 'package:ilook/services/globals.dart';
import 'package:http/http.dart' as http;

class PlannerServices {
  static Future<http.Response> createPlan(
    String nama, start_at, end_at) async {
      Map data = {
        "nama": nama,
        "start_at": start_at,
        "end_at": end_at,
        "userID": 0
      };
      dynamic myEncode(dynamic item) {
        if(item is DateTime) {
          return item.toIso8601String();
        }
        return item;
      }
      var body = json.encode(data, toEncodable: myEncode);
      var url = Uri.parse(baseURL+'planner/create');
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      print(response.body);
      return response;
  }

}