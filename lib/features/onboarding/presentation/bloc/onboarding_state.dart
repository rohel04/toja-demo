part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnboardingSuccess extends OnboardingState {
  final String message;

  OnboardingSuccess({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
