import 'package:firedash/ui/pages/login.dart';
import 'package:firedash/ui/pages/pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baby Names',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/babies': (context) => BabyVotesPage(),
      },
      initialRoute: '/',
    );
  }
}
