import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/core/usecase/usecase.dart';

import '../../domain/entities/country.dart';
import '../../domain/usecases/get_selected_country_usecase.dart';
import '../../domain/usecases/store_selected_country_usecase.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {

  final StoreSelectedCountryUsecase storeSelectedCountryUsecase;
  final GetSelectedCountryUsecase getSelectedCountryUsecase;

  CountryBloc({required StoreSelectedCountryUsecase storeUsecase, required GetSelectedCountryUsecase getUsecase}): storeSelectedCountryUsecase=storeUsecase,getSelectedCountryUsecase=getUsecase,  super(CountryInitial()) {
    on<CountryEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<StoreSelectedCountryEvent>((event, emit) async=> await _storeSelectedCountry(event, emit));
    on<LoadSelectedCountryEvent>((event, emit) async=> await _getSelectedCountry(event, emit));

  }

  Future<void> _storeSelectedCountry(StoreSelectedCountryEvent event,Emitter<CountryState> emit) async{
    final response=await storeSelectedCountryUsecase(CountryParams(code: event.code, name: event.name, key: event.key, flag: event.flag));
    await response.fold((failure) async=> emit(CountryError(message: 'Error')) , (country) async=> emit(CountryLoaded(country: country)));

  }

  Future<void> _getSelectedCountry(LoadSelectedCountryEvent event,Emitter<CountryState> emit) async{
    final response=await getSelectedCountryUsecase(NoParams());
    await response.fold((failure) async=> emit(CountryDefault(defaultcountry:Country(code: 02, name: 'Israel', key: 'is', flag: 'israel.png'),
    )), (country) async=> emit(CountryLoaded(country: country)));
}
}
