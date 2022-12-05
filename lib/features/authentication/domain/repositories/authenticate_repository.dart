import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:toja_demo/common/entities/user_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthenticateRepository{
  Future<Either<Failure,User?>> authenticate(String email,String password);
  Future<Either<Failure,User?>> registerUser(String email, String password, String? fullName, String contact, int userType,File imageFile,String? vendorName,String? city,String? streetAddress,String? username);
}