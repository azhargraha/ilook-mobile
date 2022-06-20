import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String baseURL = "http://10.0.2.2:8000/api/";
const Map<String, String> headers = {"Content-Type": "application/json"};
errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}