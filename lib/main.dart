import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilook/page/DetailPlace.dart';
import 'package:ilook/page/Home.dart';
import 'package:ilook/page/Explore.dart';
import 'package:ilook/page/LoginPage.dart';
import 'package:ilook/page/PlannerList.dart';
import 'package:ilook/page/RegisterPage.dart';
import 'package:ilook/page/PackagePage.dart';
import 'package:ilook/page/DetailPackage.dart';

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
      routes: {
        '/detail-package': (context) => DetailPackage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/detail-place': (context) => DetailPlace(),
      },
      home: LoginPage(),
    );
  }
}

class PageNavigator extends StatefulWidget {
  const PageNavigator({Key? key}) : super(key: key);

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  int _selectedIndex = 0;

  static const List<Widget> _pageOptions = [
    Home(),
    Explore(),
    PlannerPage(),
    PackagePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? Icon(Icons.home_rounded)
                  : Icon(Icons.home_outlined),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Icon(Icons.map)
                  : Icon(Icons.map_outlined),
              label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.add_task), label: 'Planner'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? Icon(Icons.article)
                  : Icon(Icons.article_outlined),
              label: 'Package'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[900],
        onTap: _onItemTap,
      ),
    );
  }
}
