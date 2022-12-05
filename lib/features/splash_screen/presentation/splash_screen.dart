import 'package:flutter/material.dart';
import 'package:toja_demo/colors_util.dart';
import 'package:toja_demo/core/util/country_check.dart';
import 'package:toja_demo/core/util/custom_statusbar.dart';
import 'package:toja_demo/features/authentication/presentation/pages/sign_in_home_screen.dart';
import 'package:toja_demo/features/select_country/presentation/pages/select_country_home.dart';

import 'wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timedelay();
  }

  void timedelay() async{
    await Future.delayed(Duration(seconds: 3));
    final result=CountryChecker.isCountryempty();
    await result?Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelectCountryScreen())):Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Wrapper()));
  }




  @override
  Widget build(BuildContext context) {
    StatusBar.CustomStatusBar();
    return Scaffold(
      body: SafeArea(child: Stack(
        children:[ Container(
          decoration: BoxDecoration(
          color: ColorUtil.kAuthColor,
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill
            )
          ),
        ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(

                  child: Image.asset('assets/images/logo.png',height: 50,width: 50,)))

        ],
      )),
    );
  }
}
