import 'package:flutter/material.dart';
import 'package:toja_demo/features/home/myorders/presentation/pages/myorders_home.dart';
import 'package:toja_demo/features/home/myprofile/presentation/pages/myaccount_home.dart';
import 'package:toja_demo/router.dart';


class MyAccountNav{
  //internal routes for myaccounts
}

class MyAccountNavScreen extends StatefulWidget {
  const MyAccountNavScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountNavScreen> createState() => _MyAccountNavScreenState();
}

class _MyAccountNavScreenState extends State<MyAccountNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: feedNav,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings routeSettings){
        Widget page;
        switch(routeSettings.name){
          case '/':
            page=MyAccountHomeScreen();
            break;
          default:
            page=Container();
        }
        return PageRouteBuilder(pageBuilder: (_,__,___)=>page);
      },
    );
  }
}
