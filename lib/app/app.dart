
import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:clean_architecture/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
@immutable
class MyApp extends StatelessWidget {
  MyApp._internal(); // named constructor

  int? appState = 0;

  static final MyApp _instance = MyApp._internal(); // single instance or singleton

  factory MyApp() =>
      _instance; // kol ma andah 3la al class ycareat al singleton

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme:getAppTheme(),
    );
  }
}