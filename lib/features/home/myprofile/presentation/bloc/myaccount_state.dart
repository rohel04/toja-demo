part of 'myaccount_bloc.dart';

@immutable
abstract class MyaccountState extends Equatable{}

class MyaccountInitial extends MyaccountState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDetailLoading extends MyaccountState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserDetailsState extends MyaccountState{

  final User? user;

  UserDetailsState({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDetailError extends MyaccountState{
  final String message;

  UserDetailError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}