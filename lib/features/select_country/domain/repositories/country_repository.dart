import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/country.dart';

abstract class CountryRepository{
  Future<Either<Failure,Country>> storeSelectedCountry({required int code,required String name,required String key,required String flag});
  Future<Either<Failure,Country>> getSelectedCountry();
}