// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "Sign_in": "Sign In",
  "Sign_up": "Sign Up",
  "Email": "EMAIL ADDRESS",
  "Password": "PASSWORD",
  "Forget_password": "Forget Password?",
  "Dont_have_account": "Don't have account?",
  "Or_continue_with": "OR CONTINUE WITH",
  "Register_as": "REGISTER AS",
  "Consumer": "Consumer",
  "Vendor": "Vendor",
  "Sign_up_with": "SIGN UP WITH",
  "Full_name": "FULL NAME",
  "Username": "USERNAME",
  "Contact": "CONTACT NUMBER",
  "Upload_profile": "UPLOAD PROFILE PICTURE",
  "Already_have_account": "Already have an account?",
  "Vendor_name": "VENDOR NAME",
  "Street_address": "STREET ADDRESS",
  "City": "CITY",
  "Business_profile": "BUSINESS PROFILE PICTURE",
  "Hebrew": "Hebrew",
  "English": "English",
  "Incorrect_email": "Incorrect email",
  "Password_lenght_of_8": "Password must be least length of 8",
  "Password_combination_validation": "Password must have uppercase, lowercase and numeric character",
  "Signed_up_success": "Signed Up successfully",
  "Authentication_failed": "Authentication failed",
  "contact_of_10": "Contact number must be of 10 digits",
  "Field_empty_validation": "Field must not be empty"
};
static const Map<String,dynamic> he = {
  "Sign_in": "להתחבר",
  "Sign_up": "הירשם",
  "Email": "כתובת דו",
  "Password": "סיסמה",
  "Forget_password": "לשכוח סיסמה ?",
  "Dont_have_account": "אין לך חשבו ?",
  "Or_continue_with": "או להמשיך עםn",
  "Register_as": "להירשם בתור",
  "Consumer": "צרכן",
  "Vendor": "מוֹכֵר",
  "Sign_up_with": "להירשם עם",
  "Full_name": "שם מלא",
  "Username": "שם משתמש",
  "Contact": "מספר ליצירת קשר",
  "Upload_profile": "להעלות תמונת פרופיל",
  "Already_have_account": "כבר יש לך חשבון ?",
  "Vendor_name": "שם ספק",
  "Street_address": "כתובת רחוב",
  "City": "עִיר",
  "Business_profile": "תמונת פרופיל עסקית",
  "Hebrew": "עִברִית",
  "English": "אנגלית",
  "Incorrect_email": "מייל שגוי",
  "Password_lenght_of_8": "הסיסמה חייבת להיות באורך של לפחות 8",
  "Password_combination_validation": "Password must have uppercase, lowercase and numeric character",
  "Signed_up_success": "הסיסמה חייבת לכלול אותיות רישיות, קטנות ומספרי",
  "Authentication_failed": "אימות נכשל",
  "contact_of_10": "מספר איש קשר חייב להיות בן 10 ספרות",
  "Field_empty_validation": "השדה לא חייב להיות ריק"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "he": he};
}
