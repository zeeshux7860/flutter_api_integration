import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_api_intigration/pages/home.dart';
import 'package:flutter_api_intigration/pages/login.dart';
import 'package:flutter_api_intigration/provider/books.dart';
import 'package:flutter_api_intigration/query/global.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> BookProvider(),)
      ],
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      var isLoggedin = await globalHandler.checkLoggedin();
      if (isLoggedin) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const Login();
        }));
      }
      timer.cancel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("LOGO"),
      ),
    );
  }
}
