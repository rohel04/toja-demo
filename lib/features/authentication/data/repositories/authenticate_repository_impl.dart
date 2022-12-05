import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toja_demo/core/errors/exceptions.dart';
import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/features/authentication/data/datasources/authentication_remote_datasource.dart';
import 'package:toja_demo/features/authentication/data/models/user_model.dart';
import 'package:toja_demo/common/entities/user_entity.dart';
import 'package:toja_demo/features/authentication/domain/repositories/authenticate_repository.dart';

import '../datasources/authentication_local_datasource.dart';

class AuthenticateRepositoryImpl implements AuthenticateRepository{

  final RemoteDataSource remoteDataSource;

  final SharedPreferences sharedPreferences;


  AuthenticateRepositoryImpl({required this.sharedPreferences, required this.remoteDataSource});

  @override
  Future<Either<Failure, User?>> authenticate(String email, String password) async{
   try{
     final user=await remoteDataSource.getAuthentication(email, password);
     return Right(user);
   }on UserNotFoundException{
     return Left(UserNotFoundFailure());
   }on InvalidCredentialsException{
     return Left(InvalidCredentialsFailure());
   }on ServerException{
     return Left(ServerFailure());
   }

  }

  @override
  Future<Either<Failure, User?>> registerUser(String email, String password, String? fullName, String contact, int userType, File imageFile, String? vendorName, String? city, String? streetAddress,String? username) async{
    try{
      final user=await remoteDataSource.registerUser(email, password, fullName, contact, userType,imageFile,vendorName,city,streetAddress,username);
      return Right(user);
    }on UserAlreadyExistsException{
      return Left(UserAlreadyExistsFailure());
    }on ServerException{
      return Left(ServerFailure());
    }
  }
}