import 'package:flutter/material.dart';
import 'package:invoicegenerator/add_page.dart';
import 'package:invoicegenerator/edit_page.dart';
import 'package:invoicegenerator/home_page.dart';
import 'package:invoicegenerator/search_page.dart';
import 'package:invoicegenerator/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/add': (context) => AddPage(),
        '/home': (context) => HomePage(),
        '/edit': (context) => EditPage(),
        '/search': (context) => SearchPage(),
      },
    );
  }
}
