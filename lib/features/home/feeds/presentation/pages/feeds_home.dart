import 'package:flutter/material.dart';

class FeedsHomeScreen extends StatefulWidget {
  const FeedsHomeScreen({Key? key}) : super(key: key);

  @override
  State<FeedsHomeScreen> createState() => _FeedsHomeScreenState();
}

class _FeedsHomeScreenState extends State<FeedsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
         title: Image.asset('assets/images/logo.png',height: 100,width: 100),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.map)),
            IconButton(onPressed: (){}, icon: Icon(Icons.notification_add)),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.08),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Food & Drink'),
                  Tab(text: 'Health & Fitness'),
                  Tab(text: 'Travel & Leisure'),

                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Center(
                child: Text('All posts'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Foods & Drinks'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Health & Fitness'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Travel & leisure'),
              ),
            ),

          ],
        )
      ),
    );
  }
}
