import 'package:clean_architecture/presentation/main/pages/home_page.dart';
import 'package:clean_architecture/presentation/main/pages/notifications_page.dart';
import 'package:clean_architecture/presentation/main/pages/search_page.dart';
import 'package:clean_architecture/presentation/main/pages/settings.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    SettingsPage(),
  ];
  var _title =AppStrings.home;
  var _currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title,style: Theme.of(context).textTheme.titleSmall,),
      ),
      body: pages[_currentIndex],
    );
  }
}
