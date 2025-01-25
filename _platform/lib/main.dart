import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:one_thousand_and_one_designs/data_sources/api_data_source.dart';
import 'package:one_thousand_and_one_designs/data_sources/sources/api_source.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/home_page.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/home_page_cubit.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/use_cases/fetch_designs_use_case.dart';
import 'package:one_thousand_and_one_designs/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final getIt = GetIt.instance;

void main() {
  usePathUrlStrategy();

  AppConfig config = AppConfig(env: AppEnv.prod, apiBaseUrl: 'https://url.com');

  getIt.registerFactory<AppConfig>(() => config);

  // data sources
  getIt.registerFactory<APIDataSource>(() => ApiSource(getIt.get()));

  // use cases
  getIt.registerFactory(() => FetchDesignsUseCase(getIt.get()));

  // cubits
  getIt.registerFactory(() => HomePageCubit(getIt.get()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: '/d/1',
    routes: [
      GoRoute(
        path: '/d/:index',
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HomePageCubit>()..loadPage(int.tryParse(state.pathParameters['index'] ?? '')),
          child: MyHomePage(),
        ),
      ),
    ],
  );

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      colorScheme: MaterialTheme.lightScheme(),
      textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '1001 Designs',
      theme: _buildTheme(Brightness.light),
      routerConfig: _router,
    );
  }
}

enum AppEnv { prod }

class AppConfig {
  AppConfig({
    required this.env,
    required this.apiBaseUrl,
  });

  final AppEnv env;
  final String apiBaseUrl;
}
