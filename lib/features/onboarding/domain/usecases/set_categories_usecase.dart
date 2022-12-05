
import 'package:dartz/dartz.dart';
import 'package:toja_demo/core/errors/failures.dart';
import 'package:toja_demo/core/usecase/usecase.dart';
import 'package:toja_demo/features/onboarding/domain/repositories/onboarding_repository.dart';

import '../entities/category.dart';

class SetCategoriesUsecase implements Usecase<void,CategoryParams>{

  final OnboardingRepository onboardingRepository;

  SetCategoriesUsecase({required this.onboardingRepository});

  @override
  Future<Either<Failure, void>> call(CategoryParams categoryParams) async{
    return await onboardingRepository.setCategories(categoryParams.category);
  }

}

class CategoryParams {
  final List<Category> category;

  CategoryParams({required this.category});

}