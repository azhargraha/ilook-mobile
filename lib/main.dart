import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilook/page/DetailPackage.dart';
import 'package:ilook/page/DetailPlace.dart';
import 'package:ilook/page/Explore.dart';
import 'package:ilook/page/LoginPage.dart';
import 'package:ilook/page/PackagePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts?.spaceGroteskTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: PackagePage());
  }
}
