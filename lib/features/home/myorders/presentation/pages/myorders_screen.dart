import 'package:flutter/material.dart';
import 'package:toja_demo/features/home/myorders/presentation/pages/myorders_home.dart';
import 'package:toja_demo/router.dart';


class MyOrdersNav{
  //internal routes for myorders
}

class MyOrdersNavScreen extends StatefulWidget {
  const MyOrdersNavScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersNavScreen> createState() => _MyOrdersNavScreenState();
}

class _MyOrdersNavScreenState extends State<MyOrdersNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: feedNav,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings routeSettings){
        Widget page;
        switch(routeSettings.name){
          case '/':
            page=MyOrdersHomeScreen();
            break;
          default:
            page=Container();
        }
        return PageRouteBuilder(pageBuilder: (_,__,___)=>page);
      },
    );
  }
}
