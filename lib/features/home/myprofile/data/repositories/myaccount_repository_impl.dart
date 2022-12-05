import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/features/home/myprofile/data/models/user_model.dart';

import '../../../../../common/entities/user_entity.dart';
import '../../domain/repositories/myaccount_repository.dart';
import '../datasources/myaccount_remote_datasources.dart';

class MyAccountRepositoryImpl implements MyAccountRepository{

  final MyAccountRemoteDataSource remoteDataSource;

  MyAccountRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModel?>> getUserDetails() async{
    try{
      var result=await remoteDataSource.getUserDetails();
      return Right(result);
    }on SocketException{
      return Left(ServerFailure());
    }
  }

}