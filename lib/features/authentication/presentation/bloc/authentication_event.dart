part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{}

class GetAuthenticationEvent extends AuthenticationEvent{
  final String email;
  final String password;

  GetAuthenticationEvent({required this.email,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];


}

class RegisterUserEvent extends AuthenticationEvent{
  final String email;
  final String password;
  final String? fullName;
  final String contact;
  final File imageFile;
  final int userType;
  final String? venderName;
  final String? city;
  final String? streetAddress;
  final String? userName;


  RegisterUserEvent({this.venderName, this.city, this.streetAddress,this.userName,this.fullName, required this.userType, required this.contact, required this.imageFile, required this.email,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}
