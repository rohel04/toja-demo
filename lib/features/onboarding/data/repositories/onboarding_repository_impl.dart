import 'dart:ffi';

import 'package:toja_demo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:toja_demo/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:toja_demo/features/onboarding/domain/entities/category.dart';
import 'package:toja_demo/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnBoardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnBoardingRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> setCategories(List<Category> category) async{
    await localDataSource.setCategory(category);
    return Right(Void);
  }

  @override
  Future<Either<Failure, void>> setDistance(int km) async {
    await localDataSource.setDistance(km);
    return Right(Void);
  }
}
