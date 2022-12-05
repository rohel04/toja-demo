import 'package:flutter/material.dart';


import '../../domain/entities/category.dart';


class CategoryProvider with ChangeNotifier {
  List<Category> checked_items = [];
  bool isValid=false;

  void checkValidation(int count) {
    if (count >= 3) {
      isValid = true;
      notifyListeners();
    } else {
      isValid = false;
      notifyListeners();
    }
  }
}
