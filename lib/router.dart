import 'package:flutter/material.dart';
import 'package:sintongsimon_learnflutter/screens/home/homepage.dart';
import 'screens/cardetail/cardetailpage.dart';
import 'screens/carlist/carlistpage.dart';

const String HomeScreen = "/";
const String CarsScreen = "/Cars";
const String CarDetailScreen = "/CarDetail";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen:
      return MaterialPageRoute(
          builder: (context) => HomePage(), settings: settings);
    case CarsScreen:
      return MaterialPageRoute(
          builder: (context) => CarListPage(), settings: settings);
    case CarDetailScreen:
      int index = settings.arguments as int;
      return MaterialPageRoute(
          builder: (context) => CarDetailPage(index: index));
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
