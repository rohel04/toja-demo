import 'package:flutter/services.dart';

import '../../colors_util.dart';



class StatusBar{

  static void CustomStatusBar(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: ColorUtil.kAuthColor, //or set color with: Color(0xFF0000FF)
  ));

  }
}