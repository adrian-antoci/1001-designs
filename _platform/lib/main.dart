import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_thousand_and_one_designs/data_sources/api_data_source.dart';
import 'package:one_thousand_and_one_designs/data_sources/sources/api_source.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/cubits/home_page_cubit.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/home_page.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/use_cases/fetch_designs_use_case.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/widgets/background.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/widgets/infinite_canvas.dart';
import 'package:one_thousand_and_one_designs/theme/theme.dart';

import 'l10n/app_localizations.dart';
import 'pages/home_page/widgets/side_panel.dart';

final getIt = GetIt.instance;

void main() {
  usePathUrlStrategy();

  AppConfig config = AppConfig(
      env: AppEnv.prod, apiBaseUrl: 'https://raw.githubusercontent.com/adrian-antoci/1001-designs/refs/heads/main');

  getIt.registerFactory<AppConfig>(() => config);

  // data sources
  getIt.registerFactory<APIDataSource>(() => ApiSource(getIt.get()));

  // use cases
  getIt.registerFactory(() => FetchDesignsUseCase(getIt.get()));

  // cubits
  getIt.registerFactory(() => HomePageCubit(getIt.get()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.interTextTheme(Theme.of(context).textTheme);
    final materialTheme = MaterialTheme(textTheme);

    final router = GoRouter(
      initialLocation: '/d/3',
      routes: [
        ShellRoute(
          builder: (_, state, child) {
            return BlocProvider(
              create: (_) => getIt<HomePageCubit>(),
              child: Background(
                child: Stack(
                  children: [
                    const InfiniteCanvas(),
                    child,
                    const SidePanel(),
                  ],
                ),
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/d/:index',
              builder: (_, state) => HomePage(
                key: UniqueKey(),
                pageIndex: int.tryParse(state.pathParameters['index'] ?? '') ?? 0,
              ),
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
