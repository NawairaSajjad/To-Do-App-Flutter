import 'package:do_to_app/home.dart';
import 'package:do_to_app/refactor/constants.dart';
import 'package:do_to_app/login.dart';
import 'package:do_to_app/register.dart';
import 'package:do_to_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(360, 690),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To do App',
         theme: ThemeData(canvasColor: Colors.grey.shade400 ),
         home: Splash(),
      ),
    );
  }
}