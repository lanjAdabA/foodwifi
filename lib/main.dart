import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodwifi/provider/muitiblocprovider.wrapper.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:foodwifi/router/router.gr.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  void initialization() async {
    Future.delayed(Duration(milliseconds: 1))
        .whenComplete(() => FlutterNativeSplash.remove());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    // FlutterNativeSplash.remove();
    return MultiproviderWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
          primaryColor: Colors.grey,
          //!<useMaterial3
          // useMaterial3: true
          //!>
        ),
        builder: EasyLoading.init(),
      ),
    );
  }
}
