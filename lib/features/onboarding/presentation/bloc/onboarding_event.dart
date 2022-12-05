part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class SetDistanceEvent extends OnboardingEvent {
  final int km;

  SetDistanceEvent({required this.km});
}

class SetCategoryEvent extends OnboardingEvent{

  final List<Category> category;

  SetCategoryEvent({required this.category});
}
