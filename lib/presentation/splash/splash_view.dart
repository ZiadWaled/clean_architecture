import 'dart:async';


import 'package:clean_architecture/presentation/resources/app_router.dart';
import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/constants_manager.dart';
import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay (){ 
    _timer =Timer( const Duration(seconds: AppConstants.splashDelay),_goNext);
  }
  _goNext (){
    GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView);

  }

  @override
  void initState() {
    super.initState();
    _startDelay();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image.asset(ImageAssets.splashLogo)),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

