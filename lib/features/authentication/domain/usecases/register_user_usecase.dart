import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/features/authentication/domain/repositories/authenticate_repository.dart';

import '../../../../core/usecase/usecase.dart';
import 'package:toja_demo/common/entities/user_entity.dart';

class RegisterUserUsecase implements Usecase<User,RegisterParams>{

  final AuthenticateRepository authenticateRepository;

  RegisterUserUsecase({required this.authenticateRepository});

  @override
  Future<Either<Failure, User?>> call(RegisterParams registerParams) async{
    return await authenticateRepository.registerUser(registerParams.email,registerParams.password,registerParams.fullName,registerParams.contact ,registerParams.userType,registerParams.imageFile,registerParams.vendorName,registerParams.city,registerParams.streetAddress,registerParams.username);
  }

}

class RegisterParams extends Equatable{
  final String email;
  final String password;
  final String contact;
  final String? fullName;
  final String? vendorName;
  final String? city;
  final String? streetAddress;
  final int userType;
  final File imageFile;
  final String? username;

  RegisterParams({this.vendorName, this.city, this.streetAddress,this.username, required this.contact, required this.fullName, required this.userType, required this.imageFile, required this.email,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}