import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/core/usecase/usecase.dart';
import 'package:toja_demo/features/authentication/domain/repositories/authenticate_repository.dart';

import 'package:toja_demo/common/entities/user_entity.dart';


class AuthenticateUserUsecase implements Usecase<User,Params>{
  
  final AuthenticateRepository authenticateRepository;

  AuthenticateUserUsecase({required this.authenticateRepository});
  
  @override
  Future<Either<Failure, User?>> call(Params params) async{
    return await authenticateRepository.authenticate(params.email, params.password);
  }
  
}
class Params extends Equatable{
  final String email;
  final String password;

  Params({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
  
  
}