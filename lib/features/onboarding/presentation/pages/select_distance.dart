import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toja_demo/features/onboarding/presentation/pages/discover.dart';
import 'package:toja_demo/injection_container.dart';

import '../../../../colors_util.dart';
import '../bloc/onboarding_bloc.dart';

class SelectDistanceScreen extends StatefulWidget {
  const SelectDistanceScreen({Key? key}) : super(key: key);

  @override
  State<SelectDistanceScreen> createState() => _SelectDistanceScreenState();
}

class _SelectDistanceScreenState extends State<SelectDistanceScreen> {
  int km = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Set distance'),
        ),
        body: BlocProvider(
          create: ((context) => sl<OnboardingBloc>()),
          child: BlocConsumer<OnboardingBloc, OnboardingState>(
            listener: ((context, state) {
              if (state is OnboardingSuccess) {

              }
            }),
            builder:(context,state)=> Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        'How far are you willing to travel?',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 26, color: Color(0xFF050E26)),
                      )),
                  Stack(children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              opacity: 0.2,
                              image: AssetImage('assets/images/map.jpg'))),
                      height: 300,
                      width: double.infinity,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Color(0xFF050E26),
                              color: Color(0xFF050E26),
                              borderRadius: BorderRadius.circular(50)),
                          height: 70,
                          width: 70,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$km',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 26),
                              ),
                              Text('KM', style: TextStyle(color: Colors.white))
                            ],
                          )),
                        ),
                      ),
                    ),
                    Positioned(
                        height: 25,
                        width: 25,
                        top: 140,
                        left: 230,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF3A4667),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50))),
                          child: IconButton(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 10,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (km >= 1) {
                                  km--;
                                }
                              });
                            },
                          ),
                        )),
                    Positioned(
                      height: 25,
                      width: 25,
                      top: 140,
                      left: 250,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF3A4667),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50))),
                        child: IconButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 10,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (km <= 9) {
                                km++;
                              }
                            });
                          },
                        ),
                      ),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '2',
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
                            context
                                .read<OnboardingBloc>()
                                .add(SetDistanceEvent(km: km));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiscoverScreen()));
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Continue',
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
            ),
          ),
        ));
  }
}
