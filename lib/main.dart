import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sintongsimon_learnflutter/providers/themeprovider.dart';
import 'package:sintongsimon_learnflutter/router.dart' as router;
import 'package:sintongsimon_learnflutter/apptheme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _themeState = ref.watch(themeProvider);
    return MaterialApp(
        title: 'SintongSimon Learn Flutter',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeState.IsDarkTheme ? ThemeMode.dark : ThemeMode.light,
        initialRoute: router.HomeScreen,
        onGenerateRoute: router.generateRoute
        // routes: <String, WidgetBuilder>{
        //   "/": (context) => HomePage(),
        //   "/CarsPage": (context) => CarsPage(),
        //   "/CarDetailPage": (context) => const CarDetailPage(),
        // },
        );
  }
}
