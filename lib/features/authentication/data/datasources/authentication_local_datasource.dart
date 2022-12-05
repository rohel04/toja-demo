// import 'dart:convert';
//
// import '../models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// abstract class AuthenticationLocalDataSource{
//   Future<UserModel> getCredentials();
//   Future<void> storeCredentials(UserModel userModel);
// }
//
// class AuthenticationLocalDataSourceImpl implements AuthenticationLocalDataSource{
//
//   final SharedPreferences sharedPreferences;
//
//   AuthenticationLocalDataSourceImpl({required this.sharedPreferences});
//
//   @override
//   Future<UserModel> getCredentials() async{
//     final user=sharedPreferences.getString('credentials');
//       return Future.value(UserModel.fromJson(jsonDecode(user!)));
//
//   }
//
//   @override
//   Future<void> storeCredentials(UserModel userModel) async {
//          sharedPreferences.setString('credentials', jsonEncode(userModel.toJson()));
//
//   }
//
// }