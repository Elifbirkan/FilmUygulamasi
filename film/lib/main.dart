import 'package:film/pages/AdminPage.dart';
import 'package:film/pages/CategoryPage.dart';
import 'package:film/pages/HomePage.dart';
import 'package:film/pages/MoviePage.dart';
import 'package:film/pages/PlatformlarPage.dart';
import 'package:film/pages/records_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0F111D),
      ),
      routes: {
        "/": (context) => HomePage(),
        "categoryPage": (context) => CategoryPage(),
        "moviePage": (context) => MoviePage(),
        "adminPage": (context) => AdminPage(),
        "platformlarPage": (context) => PlatformlarPage(),
        "recordsPage": (context) => RecordsPage(),
      },
    );
  }
}
