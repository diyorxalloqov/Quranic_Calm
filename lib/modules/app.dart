import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class App extends StatelessWidget {
  const App({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    debugPrint("system is ${Platform.operatingSystem}");
    if (Platform.isAndroid) {
      return const AndroidApp();
    } else if (Platform.isIOS) {
      return const IosApp();
    } else if (Platform.isMacOS) {
      return const MacosApp();
    } else if (kIsWeb) {
      return const WebApp();
    } else {
      return const AndroidApp();
    }
  }
}

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      dark: AppTheme().darkMode,
      light: AppTheme().lightMode,
      builder: (ThemeData theme, ThemeData dark) {
        return ScreenUtilInit(
          designSize: kIsWeb ? const Size(1440, 1024) : const Size(393, 852),
          builder: (context, child) => MultiBlocProvider(
            providers: [BlocProvider(create: (context) => MediatationBloc())],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: AppTheme().darkMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: theme,
              themeMode: ThemeMode.system,
              navigatorKey: App.navigatorKey,
              initialRoute: '/',
              onGenerateRoute: RouteList.router.onGenerate,
            ),
          ),
        );
      },
    );
  }
}

class IosApp extends StatelessWidget {
  const IosApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CupertinoAdaptiveTheme(
        initial: AdaptiveThemeMode.system,
        dark: AppTheme().cupertinoDarkMode,
        light: AppTheme().cupertinoLightMode,
        builder: (CupertinoThemeData theme) {
          return ScreenUtilInit(
              designSize:
                  kIsWeb ? const Size(1440, 1024) : const Size(393, 852),
              builder: (context, child) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => MediatationBloc())
                    ],
                    child: CupertinoApp(
                      debugShowCheckedModeBanner: false,
                      navigatorKey: App.navigatorKey,
                      initialRoute: '/',
                      theme: theme,
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      onGenerateRoute: RouteList.router.onGenerate,
                    ),
                  ));
        });
  }
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      dark: AppTheme().darkMode,
      light: AppTheme().lightMode,
      builder: (ThemeData theme, ThemeData dark) {
        return ScreenUtilInit(
          designSize: kIsWeb ? const Size(1440, 1024) : const Size(393, 852),
          builder: (context, child) => MultiBlocProvider(
            providers: [BlocProvider(create: (context) => MediatationBloc())],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: AppTheme().darkMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: theme,
              themeMode: ThemeMode.system,
              navigatorKey: App.navigatorKey,
              initialRoute: '/',
              onGenerateRoute: RouteList.router.onGenerate,
            ),
          ),
        );
      },
    );
  }
}

class MacosApp extends StatelessWidget {
  const MacosApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CupertinoAdaptiveTheme(
        initial: AdaptiveThemeMode.system,
        dark: AppTheme().cupertinoDarkMode,
        light: AppTheme().cupertinoLightMode,
        builder: (CupertinoThemeData theme) {
          return ScreenUtilInit(
              designSize: kIsWeb ? const Size(1440, 900) : const Size(393, 852),
              builder: (context, child) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => MediatationBloc())
                    ],
                    child: CupertinoApp(
                      debugShowCheckedModeBanner: false,
                      navigatorKey: App.navigatorKey,
                      initialRoute: '/',
                      theme: theme,
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      onGenerateRoute: RouteList.router.onGenerate,
                    ),
                  ));
        });
  }
}
