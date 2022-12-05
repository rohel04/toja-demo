import 'package:easy_localization/easy_localization.dart';
import 'package:toja_demo/generated/locale_keys.g.dart';

class CustomValidator {
  static String? passwordValidator(String? value) {
    if (value!.isEmpty || value.length < 8) {
      return LocaleKeys.Password_lenght_of_8.tr();
    } else {
      RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
      if (!regex.hasMatch(value)) {
        return LocaleKeys.Password_combination_validation.tr();
      }
    }
  }

  static String? emailValidator(String? value){
    if (value!.isEmpty ||
        !value.contains('@')) {
      return LocaleKeys.Incorrect_email.tr();
    }
  }

  static String? emptyValidation(String? value){
    if(value!.isEmpty){
      return LocaleKeys.Field_empty_validation.tr();
    }
  }

  static String? phoneValidator(String? value){
    if(value!.length!=10){
      return LocaleKeys.contact_of_10.tr();
    }
  }
}
