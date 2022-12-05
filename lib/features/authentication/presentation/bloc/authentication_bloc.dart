

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/generated/locale_keys.g.dart';
import '../../domain/usecases/authenticate_user_usecase.dart';
import '../../domain/usecases/register_user_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  static String serverFailureMsg='Server Failure. Please check you connection !!';

  final AuthenticateUserUsecase authenticateUserUsecase;
  final RegisterUserUsecase registerUserUsecase;

  AuthenticationBloc({required RegisterUserUsecase registerUser, required AuthenticateUserUsecase authUser}) : authenticateUserUsecase=authUser,registerUserUsecase=registerUser,super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
    });
    on<GetAuthenticationEvent>((event, emit) async=>await _getUserAuthentication(event, emit));
    on<RegisterUserEvent>((event, emit) async=>await _registerUser(event, emit));
  }

  Future<void> _getUserAuthentication(GetAuthenticationEvent event,Emitter<AuthenticationState> emit) async{
    emit(AuthenticationLoading());
    String email=event.email;
    String password=event.password;
    final response=await authenticateUserUsecase(Params(email: email, password: password));
    await response.fold((failure) async=>  emit(AuthenticationError(message:failure is InvalidCredentialsFailure? "Invalid Credentials":failure is UserNotFoundFailure?"User not found":serverFailureMsg)), (user) async=> emit(AuthenticationLoaded()) );

  }
  Future<void> _registerUser(RegisterUserEvent event,Emitter<AuthenticationState> emit) async{
    emit(AuthenticationLoading());
    String email=event.email;
    String password=event.password;
    final response=await registerUserUsecase(RegisterParams(email: email, password: password,contact: event.contact,fullName: event.fullName,imageFile: event.imageFile,userType: event.userType,vendorName: event.venderName,city: event.city,streetAddress: event.streetAddress,username: event.userName));
    await response.fold((failure) async=> emit(RegistrationError(message: failure is UserAlreadyExistsFailure? 'Email address is already used!':serverFailureMsg)), (user) async=>emit(RegistrationSuccess()) );
  }

}
