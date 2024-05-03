import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  void startTimer() {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAll(()=> SignUp());

    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Icon(
          Icons.production_quantity_limits,
          size: 30.0,
          color: Colors.green,
        ),
      ),
    );
  }
}
