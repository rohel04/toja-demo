import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/country_model.dart';

abstract class CountryLocalDataSource{
  Future<CountryModel> storeSelectedCountry(CountryModel countryModel);
  Future<CountryModel> getSelectedCountry();

}

class CountryLocalDataSourceImpl implements CountryLocalDataSource{

  final SharedPreferences sharedPreferences;

  CountryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<CountryModel> storeSelectedCountry(CountryModel countryModel) async {
    await sharedPreferences.setString('country',jsonEncode(countryModel.toJson()));
    final data=sharedPreferences.getString('country');
    final country=CountryModel.fromJson(jsonDecode(data!));
    return Future.value(country);
  }

  @override
  Future<CountryModel> getSelectedCountry() {
    if(sharedPreferences.getString('country')!=null){
      final data=sharedPreferences.getString('country');
      final country=CountryModel.fromJson(jsonDecode(data!));
      return Future.value(country);
      }
    else{
      throw CacheException();
    }
    }
}