import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toja_demo/colors_util.dart';
import 'package:toja_demo/core/util/custom_statusbar.dart';
import 'package:toja_demo/features/select_country/presentation/bloc/country_bloc.dart';
import 'package:toja_demo/features/splash_screen/presentation/splash_screen.dart';
import 'package:toja_demo/generated/codegen_loader.g.dart';
import 'package:toja_demo/injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:toja_demo/router.dart';
import 'features/home/home_screen.dart';
import 'injection_container.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('he')],
      startLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      path: 'assets/translations',
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatusBar.CustomStatusBar();
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<CountryBloc>())],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings routeSettings)=>Routers.generatedRoute(routeSettings),
        home: SplashScreen(),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                color: ColorUtil.kAuthColor,
                elevation: 0.0,
                titleTextStyle:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
