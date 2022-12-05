import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

}

class ServerFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class InvalidCredentialsFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CacheFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserAlreadyExistsFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserNotFoundFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}