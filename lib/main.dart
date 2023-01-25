import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodwifi/provider/muitiblocprovider.wrapper.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'router/router.gr.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiproviderWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(primaryColor: Colors.grey),
        builder: EasyLoading.init(),
      ),
    );
  }
}
