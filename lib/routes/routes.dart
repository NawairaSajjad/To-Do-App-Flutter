import 'package:do_to_app/home.dart';
import 'package:do_to_app/login.dart';
import 'package:do_to_app/register.dart';
import 'package:do_to_app/routes/route_name.dart';
import 'package:do_to_app/splash.dart';
import 'package:flutter/material.dart';

class Routes {
static Route<dynamic>  generateRoute(RouteSettings setting)  {
    switch(setting.name){
      case RoutesNames.splashScreen:
      return MaterialPageRoute(builder: (context)=>Splash());
      case RoutesNames.registerScreen:
      return MaterialPageRoute(builder: (context)=>Register()); 
      case RoutesNames.loginScreen:
      return MaterialPageRoute(builder: (context)=> Login());
      case RoutesNames.homeScreen:
      return MaterialPageRoute(builder: (context)=>Home());
      default :
      return MaterialPageRoute(builder: (context){
        return
        Scaffold(
        body: Center(child: Text('no page found')),);

      }) 
      ;
    }
  }
}
