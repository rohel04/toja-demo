import 'package:flutter/material.dart';
import 'package:toja_demo/features/home/home_screen.dart';


GlobalKey<NavigatorState> feedNav=GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> myOrdersNav=GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> discoverNav=GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> searchNav=GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> myProfileNav=GlobalKey<NavigatorState>();


class Routers{
  static const homeScreen='/homeScreen';
  static const feedScreen='/feedScreen';
  static const myOrderScreen='/myOrderScreen';
  static const discoverScreen='/discoverScreen';
  static const searchScreen='/searchScreen';
  static const myProfileScreen='/myProfileScreen';

  static Route<dynamic> generatedRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case homeScreen:
        return MaterialPageRoute(builder: (_)=>HomeScreen());
      default:
        return MaterialPageRoute(builder: (_)=>Container());
    }
  }

}