import 'package:flutter/material.dart';
import 'package:toja_demo/router.dart';

import 'feeds_home.dart';

class FeedScreenNav{
  //internal routes for feed
}

class FeedNavScreen extends StatefulWidget {
  const FeedNavScreen({Key? key}) : super(key: key);

  @override
  State<FeedNavScreen> createState() => _FeedNavScreenState();
}

class _FeedNavScreenState extends State<FeedNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: feedNav,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings routeSettings){
        Widget page;
        switch(routeSettings.name){
          case '/':
            page=FeedsHomeScreen();
            break;
          default:
            page=Container();
        }
        return PageRouteBuilder(pageBuilder: (_,__,___)=>page);
      },
    );
  }
}
