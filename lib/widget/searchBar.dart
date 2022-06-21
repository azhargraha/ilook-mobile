import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ilook/models/Pariwisata.dart';
import 'package:http/http.dart' as http;

class SearchBar extends StatelessWidget {
  final TextEditingController _searchControl = new TextEditingController();
  Future<List<Pariwisata>> fetchPariwisata(http.Client client, String lokasi) async {
  final response = await client.get(Uri.parse('http://10.0.2.2:8000/api/pariwisata/search/' + lokasi));
  List<dynamic> data = jsonDecode(response.body)['pariwisata'];
  List<Pariwisata> list = [];
  if (response.body != null) {
    list = data.map((item) => Pariwisata.fromJson(item)).toList();
  }
  return list;
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey[300],
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: "Search destination",
          prefixIcon: Icon(
            Icons.location_on,
            color: Colors.blueGrey[300],
          ),
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[300],
          ),
        ),
        maxLines: 1,
        controller: _searchControl,
        onChanged: fetchPariwisata(http.Client(), _searchControl.text),
      ),
    );
  }
}