import 'package:flutter/material.dart';

class DiscoverCard extends StatefulWidget {
  const DiscoverCard({Key? key}) : super(key: key);

  @override
  State<DiscoverCard> createState() => _DiscoverCardState();
}

class _DiscoverCardState extends State<DiscoverCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 370,
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/sunshine_vendor.png')
          )
        ),

    );
  }
}
