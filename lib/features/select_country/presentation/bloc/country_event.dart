part of 'country_bloc.dart';

@immutable
abstract class CountryEvent extends Equatable{}

class StoreSelectedCountryEvent extends CountryEvent{

  int code;
  String key;
  String flag;
  String name;

  StoreSelectedCountryEvent({required this.code,required this.key,required this.flag,required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [code,key,flag,name];

}


class LoadSelectedCountryEvent extends CountryEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}