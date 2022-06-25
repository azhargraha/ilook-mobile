import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ilook/services/globals.dart';

class RatingService {
  static Future<http.Response> postRating(int ratingValue, wisataId) async {
    Map data = {
      "rating": ratingValue.toDouble(),
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'pariwisata/${wisataId}/rating');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
