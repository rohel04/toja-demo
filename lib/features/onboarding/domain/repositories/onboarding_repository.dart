import 'package:dartz/dartz.dart';
import 'package:toja_demo/features/onboarding/domain/entities/category.dart';

import '../../../../core/errors/failures.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, void>> setDistance(int km);
  Future<Either<Failure, void>> setCategories(List<Category> category);
}
