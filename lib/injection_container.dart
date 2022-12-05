import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toja_demo/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:toja_demo/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:toja_demo/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:toja_demo/features/onboarding/domain/usecases/set_categories_usecase.dart';
import 'package:toja_demo/features/onboarding/domain/usecases/set_distance_usecase.dart';
import 'package:toja_demo/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:toja_demo/features/select_country/data/datasources/country_local_datasource.dart';
import 'package:toja_demo/features/select_country/domain/usecases/get_selected_country_usecase.dart';
import 'package:toja_demo/features/select_country/domain/usecases/store_selected_country_usecase.dart';
import 'package:toja_demo/features/select_country/presentation/bloc/country_bloc.dart';
import 'features/authentication/data/datasources/authentication_local_datasource.dart';
import 'features/authentication/data/datasources/authentication_remote_datasource.dart';
import 'features/authentication/data/repositories/authenticate_repository_impl.dart';
import 'features/authentication/domain/repositories/authenticate_repository.dart';
import 'features/authentication/domain/usecases/authenticate_user_usecase.dart';
import 'features/authentication/domain/usecases/register_user_usecase.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/home/myprofile/data/datasources/myaccount_remote_datasources.dart';
import 'features/home/myprofile/data/repositories/myaccount_repository_impl.dart';
import 'features/home/myprofile/domain/repositories/myaccount_repository.dart';
import 'features/home/myprofile/domain/usecases/get_userdetail_usecase.dart';
import 'features/home/myprofile/presentation/bloc/myaccount_bloc.dart';
import 'features/select_country/data/repositories/country_repository_impl.dart';
import 'features/select_country/domain/repositories/country_repository.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(authUser: sl(), registerUser: sl()));
  sl.registerFactory<CountryBloc>(
      () => CountryBloc(storeUsecase: sl(), getUsecase: sl()));
  sl.registerFactory<OnboardingBloc>(
      () => OnboardingBloc(setDistanceUsecase: sl(), setCategoryUsecase: sl()));
  sl.registerFactory<MyaccountBloc>(() => MyaccountBloc(getUserDetails: sl()));

  //usecases
  sl.registerLazySingleton(
      () => AuthenticateUserUsecase(authenticateRepository: sl()));
  sl.registerLazySingleton(
      () => RegisterUserUsecase(authenticateRepository: sl()));
  sl.registerLazySingleton(
      () => StoreSelectedCountryUsecase(countryRepository: sl()));
  sl.registerLazySingleton(
      () => GetSelectedCountryUsecase(countryRepository: sl()));
  sl.registerLazySingleton(
      () => SetDistanceUsecase(onboardingRepository: sl()));
  sl.registerLazySingleton(() => SetCategoriesUsecase(onboardingRepository: sl()));
  sl.registerLazySingleton(() => GetUserDetails(myAccountRepository: sl()));

  //repository
  sl.registerLazySingleton<AuthenticateRepository>(() =>
      AuthenticateRepositoryImpl(
          remoteDataSource: sl(),
          sharedPreferences: sl(),
          ));
  sl.registerLazySingleton<CountryRepository>(
      () => CountryRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<OnboardingRepository>(
      () => OnBoardingRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<MyAccountRepository>(() => MyAccountRepositoryImpl(remoteDataSource: sl()));

  //datasources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(firebaseAuth: sl()));
  sl.registerLazySingleton<CountryLocalDataSource>(
      () => CountryLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<MyAccountRemoteDataSource>(() => MyAccountRemoteDataSourceImpl(firebaseAuth: sl(), firebaseStore: sl()));

  //external
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPref);
  final firebaseAuth=FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
  final fireStore=await FirebaseFirestore.instance;
  sl.registerLazySingleton(() => fireStore);
}
