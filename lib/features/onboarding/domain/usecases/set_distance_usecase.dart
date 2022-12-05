import 'dart:ffi';

import 'package:toja_demo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:toja_demo/core/usecase/usecase.dart';
import 'package:toja_demo/features/onboarding/domain/repositories/onboarding_repository.dart';

class SetDistanceUsecase implements Usecase<void, DistanceParam> {
  final OnboardingRepository onboardingRepository;

  SetDistanceUsecase({required this.onboardingRepository});

  @override
  Future<Either<Failure, void>> call(DistanceParam distanceParam) async {
    return await onboardingRepository.setDistance(distanceParam.km);
  }
}

class DistanceParam {
  final int km;

  DistanceParam({required this.km});
}
