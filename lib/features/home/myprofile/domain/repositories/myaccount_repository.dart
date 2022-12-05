import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';

abstract class MyAccountRepository{
  Future<Either<Failure,UserModel?>> getUserDetails();
}