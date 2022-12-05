

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toja_demo/features/onboarding/domain/usecases/set_distance_usecase.dart';

import '../../domain/entities/category.dart';
import '../../domain/usecases/set_categories_usecase.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final SetDistanceUsecase setDistanceUsecase;
  final SetCategoriesUsecase setCategoryUsecase;

  OnboardingBloc({required this.setCategoryUsecase, required this.setDistanceUsecase})
      : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SetDistanceEvent>(
        (event, emit) async => await _setDistance(event, emit));
    on<SetCategoryEvent>((event,emit) async=>await _setCategory(event, emit));
  }

  Future<void> _setDistance(
      SetDistanceEvent event, Emitter<OnboardingState> emit) async {
    emit(OnboardingInitial());
    int km = event.km;
    final response = await setDistanceUsecase(DistanceParam(km: km));
    await response.fold(
        (failure) => null,
        (Void) async => emit(OnboardingSuccess(
            message: 'Distance set successfully')));
  }

  Future<void> _setCategory(SetCategoryEvent event,Emitter<OnboardingState> emit) async{
    emit(OnboardingInitial());
    final response=await setCategoryUsecase(CategoryParams(category: event.category));
    await response.fold((failure) => null, (Void) async=> emit(OnboardingSuccess(message: 'Category selected successfully')));
  }
}
