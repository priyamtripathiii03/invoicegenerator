import 'package:flutter/material.dart';
import 'package:invoicegenerator/add_page.dart';
import 'package:invoicegenerator/edit_page.dart';
import 'package:invoicegenerator/home_page.dart';
import 'package:invoicegenerator/pdf_view.dart';
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
        '/': (context) => const SplashScreen(),
        '/add': (context) => const AddPage(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/edit': (context) => const EditPage(),
        '/PDF': (context) => const PdfView(),

      },
    );
  }
}
