import 'dart:async';
import 'package:flutter/material.dart';
import 'package:think_forge_assesment/app/routes/app_routes.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Image.network('https://img.pikbest.com/origin/10/41/85/35HpIkbEsTU62.png!w700wp', height: 100),
      ),
    );
  }
}
