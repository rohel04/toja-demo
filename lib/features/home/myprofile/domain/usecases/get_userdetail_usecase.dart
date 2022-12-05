import 'package:dartz/dartz.dart';

import 'package:toja_demo/core/errors/failures.dart';

import '../../../../../common/entities/user_entity.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repositories/myaccount_repository.dart';

class GetUserDetails implements Usecase<User,NoParams>{

  final MyAccountRepository myAccountRepository;

  GetUserDetails({required this.myAccountRepository});

  @override
  Future<Either<Failure, User?>> call(NoParams params) async{
    return await myAccountRepository.getUserDetails();
  }

}