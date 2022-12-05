import 'package:dartz/dartz.dart';
import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/core/usecase/usecase.dart';

import '../entities/country.dart';
import '../repositories/country_repository.dart';

class StoreSelectedCountryUsecase implements Usecase<Country,CountryParams>{

  final CountryRepository countryRepository;

  StoreSelectedCountryUsecase({required this.countryRepository});

  @override
  Future<Either<Failure, Country>> call(CountryParams countryParams) async{
    return await countryRepository.storeSelectedCountry(name: countryParams.name,flag: countryParams.flag,key: countryParams.key,code: countryParams.code);
  }

}

class CountryParams {
  final int code;
  final String name;
  final String key;
  final String flag;

  CountryParams({required this.code, required this.name, required this.key, required this.flag});
}