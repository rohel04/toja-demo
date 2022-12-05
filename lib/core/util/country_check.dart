import 'package:shared_preferences/shared_preferences.dart';

import '../../injection_container.dart';

class CountryChecker{

  static final prefs=sl<SharedPreferences>();

  static Future<bool> isCountryempty() async{
    final result=await prefs.getString('country');
    if(result!=null){
      return false;
    }
    else{
      return true;
    }
  }
}