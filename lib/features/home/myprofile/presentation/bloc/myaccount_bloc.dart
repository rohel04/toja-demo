import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../common/entities/user_entity.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_userdetail_usecase.dart';

part 'myaccount_event.dart';
part 'myaccount_state.dart';

class MyaccountBloc extends Bloc<MyaccountEvent, MyaccountState> {

  final GetUserDetails getUserDetails;

  MyaccountBloc({required this.getUserDetails}) : super(MyaccountInitial()) {
    on<MyaccountEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetUserDetailsEvent>((event, emit) async=> await _getUserDetail(event, emit));
  }

  Future<void> _getUserDetail(GetUserDetailsEvent event,Emitter<MyaccountState> emit) async{
    emit(UserDetailLoading());
    final result=await getUserDetails(NoParams());
    await result.fold((failure) async=> emit(UserDetailError(message: 'Server Failure')), (user) async=> emit(
      UserDetailsState(user: user)
    ));
  }
}
