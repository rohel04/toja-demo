import 'package:flutter/material.dart';

class MyOrdersHomeScreen extends StatefulWidget {
  const MyOrdersHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersHomeScreen> createState() => _MyOrdersHomeScreenState();
}

class _MyOrdersHomeScreenState extends State<MyOrdersHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My orders'),
      ),
      body: Container(
        child: Center(
          child: Text('My orders'),
        ),
      ),
    );
  }
}
