import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toja_demo/features/onboarding/domain/entities/category.dart';

abstract class OnboardingLocalDataSource {
  Future<void> setDistance(int km);
  Future<void> setCategory(List<Category> category);
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  OnboardingLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> setDistance(int km) async {
    print(sharedPreferences.getString('category'));
    await sharedPreferences.setInt('km', km);
  }

  @override
  Future<void> setCategory(List<Category> category) async{
    await sharedPreferences.setString('category', jsonEncode(category));

  }
}
