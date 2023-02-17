import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/router/router.gr.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  void pagenavigation() async {
    Future.delayed(Duration(seconds: 2))
        .whenComplete(() => context.router.replace(HomeDashboardRoute()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pagenavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Image.asset(
          "assets/splash.gif",
          fit: BoxFit.fitHeight,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
