import 'package:flutter/material.dart';
import '../../../../colors_util.dart';
import '../../../home/home_screen.dart';
import '../widgets/discover_card.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void onRightSwap(){
    print('Like pressed');
  }

  void onLeftSwap(){
    print('Skip pressed');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[ InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
          },
              child: Text('Skip',style: TextStyle(color: Colors.white,fontSize: 16),),
            ),
            SizedBox(width: 10)
            ]
          )
        ],
      ),
      body:Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Swipe right or left', style:
                    TextStyle(fontSize: 26, color: Color(0xFF050E26))),
                    SizedBox(height: 10),
                    Text('Right to follow vendor and left to skip',style: TextStyle(color: Color(0xFF9DA3B3),fontSize: 14),)
                  ],
                ),]
              ),
            ),
            GestureDetector(
                onHorizontalDragUpdate: (detail){
                  if(detail.delta.dx>0){
                      onRightSwap();
                  }
                  else if(detail.delta.dx<0){
                      onLeftSwap();
                  }
                },
                child: Stack(children: [
                  DiscoverCard(),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
                          child: Row(
                            children: [
                              Image.asset('assets/images/sunshine.png',height: 40,width: 40),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text('Sunshine Cafe',style: TextStyle(fontSize: 16,color: Colors.white),),
                            Text('3 km away',style: TextStyle(fontSize: 12,color: Colors.white),)
                        ],
                      ),

                            ],
                          ) )),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                    InkWell(
                        onTap: (){
                          onLeftSwap();
                        },
                        child: Image.asset('assets/images/cancel.png',height: 40,width: 40,)),
                   InkWell(
                     onTap: (){
                       onRightSwap();
                     },
                     child: Image.asset('assets/images/like.png',height: 40,width: 40,),)
                  ],),
                      ))
                ])),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '3',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorUtil.kAuthColor),
                      ),
                      Text(
                        '/3',
                        style: TextStyle(color: ColorUtil.kAuthTextColor),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorUtil.kAuthColor),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            color: ColorUtil.kAuthColor,
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
