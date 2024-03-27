import 'package:clean_architecture/app/app.dart';
import 'package:clean_architecture/app/di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // initialized all instance then start app
  await initAppModule();
  runApp(MyApp());
}
