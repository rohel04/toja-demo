part of 'country_bloc.dart';

@immutable
abstract class CountryState extends Equatable{}

class CountryInitial extends CountryState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CountryLoaded extends CountryState{

  Country country;

  CountryLoaded({required this.country});

  @override
  // TODO: implement props
  List<Object?> get props => [country];
}

class CountryError extends CountryState{
  final String message;

  CountryError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class CountryDefault extends CountryState{

  Country defaultcountry;

  CountryDefault({required this.defaultcountry});

  @override
  // TODO: implement props
  List<Object?> get props => [defaultcountry];

}
