import 'package:flutter/material.dart';
import 'package:sintongsimon_learnflutter/cardetailpage.dart';
import 'package:sintongsimon_learnflutter/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sintongsimon_learnflutter Learn Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (context) => const HomePage(),
        "/CarDetailPage": (context) => const CarDetailPage(),
      },
    );
  }
}
