import 'package:dartz/dartz.dart';
import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/core/usecase/usecase.dart';

import '../entities/country.dart';
import '../repositories/country_repository.dart';

class GetSelectedCountryUsecase implements Usecase<Country,NoParams>{

  final CountryRepository countryRepository;

  GetSelectedCountryUsecase({required this.countryRepository});

  @override
  Future<Either<Failure, Country>> call(NoParams noParams) async{
    return await countryRepository.getSelectedCountry();
  }

}

