import 'package:firedash/ui/pages/login.dart';
import 'package:firedash/ui/pages/pages.dart';
import 'package:firedash/utils/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServices();
  runApp(MyApp());
}

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
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.teal[200],
        primaryColorDark: Colors.teal[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal[200],
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          backgroundColor: Colors.teal[200],
          textStyle: TextStyle(
            color: Colors.black,
          ),
        )),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.teal[200],
        ),
      ),
      initialRoute: '/',
    );
  }
}
