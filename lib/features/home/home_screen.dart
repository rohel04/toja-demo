import 'package:flutter/material.dart';
import 'package:toja_demo/features/home/feeds/presentation/pages/feeds_home.dart';
import 'package:toja_demo/features/home/myprofile/presentation/pages/myaccount_home.dart';
import 'package:toja_demo/router.dart';

import '../../colors_util.dart';
import 'myorders/presentation/pages/myorders_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> pages=[
    FeedsHomeScreen(),
    MyOrdersHomeScreen(),
    MyAccountHomeScreen(),
  ];
  
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: ColorUtil.kAuthColor,
          elevation: 10,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.feed_outlined),label: 'Feeds',),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'My Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.person_pin_outlined),label: 'My Profile')
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    if(index==0){
      feedNav.currentState?.pushReplacementNamed('/');
    }
    if(index==1){
      myOrdersNav.currentState?.pushReplacementNamed('/');
    }
    if(index==2){
      myProfileNav.currentState?.pushReplacementNamed('/');
    }

    setState(() {
      currentIndex=index;
    });
  }
}
