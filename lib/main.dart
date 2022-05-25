import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('test'),
          ),
          body: Center(
            child: Text(
              'test',
              style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 100)),
            ),
          ),
        ));
  }
}
