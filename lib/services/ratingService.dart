import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ilook/services/globals.dart';

class Rating {
  double? rating;
  Map? details;

  Rating({this.rating, this.details});

  factory Rating.createRating(Map<String, dynamic> obj) {
    return Rating(rating: obj['rating'], details: obj['details']);
  }

  static Future<Rating> fetchRating(String id) async {
    final uri = Uri(
        scheme: 'http',
        host: '192.168.1.10',
        port: 8000,
        path: '/api/rating/${id}');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('gagal');
    }
    var jsonObj = json.decode(response.body);

    return Rating.createRating(
        {'rating': jsonObj['rating'], 'details': jsonObj['details']});
  }
}
