import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Package {
  final int paketID;
  final String title;
  final String description;
  final String thumbnailUrl;

  const Package(
      {required this.paketID,
      required this.title,
      required this.description,
      required this.thumbnailUrl});
  factory Package.fromJson(Map <String, dynamic> json){
    return Package(
      paketID: json['paketID'],
      title: json['nama'],
      description: json['deskripsi'],
      thumbnailUrl: json['thumbnailUrl']
    );
  }
}