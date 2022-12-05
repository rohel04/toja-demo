import 'package:dartz/dartz.dart';
import 'package:toja_demo/core/errors/exceptions.dart';

import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/features/select_country/data/datasources/country_local_datasource.dart';
import 'package:toja_demo/features/select_country/data/models/country_model.dart';

import 'package:toja_demo/features/select_country/domain/entities/country.dart';

import '../../domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository{

  final CountryLocalDataSource localDataSource;

  CountryRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Country>> storeSelectedCountry({required int code, required String name, required String key, required String flag}) async{
    final country=await localDataSource.storeSelectedCountry(CountryModel(code: code, name: name, key: key, flag: flag));
    return Right(country);

  }

  @override
  Future<Either<Failure, Country>> getSelectedCountry() async{
    try {
      final country = await localDataSource.getSelectedCountry();
      return Right(country);
    }
    on CacheException{
      return Left(CacheFailure());
    }
  }
}