
import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class App extends StatelessWidget {
  const App({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? const IosApp() : const AndroidApp();
  }
}

class AndroidApp extends StatefulWidget {
  const AndroidApp({super.key});

  @override
  State<AndroidApp> createState() => _AndroidAppState();
}

class _AndroidAppState extends State<AndroidApp> with WidgetsBindingObserver {
  @override
  void initState() {
    // RouteList.router.loadAd();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        // Handle app resumed state
        break;
      case AppLifecycleState.inactive:
        // Handle app inactive state
        break;
      case AppLifecycleState.paused:
        // Handle app paused state
        break;
      case AppLifecycleState.detached:
        // Handle app detached state
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
  }

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
          builder: (context, child) => MaterialApp(
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
        );
      },
    );
  }
}

class IosApp extends StatefulWidget {
  const IosApp({super.key});

  @override
  State<IosApp> createState() => _IosAppState();
}

class _IosAppState extends State<IosApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        // Handle app resumed state
        break;
      case AppLifecycleState.inactive:
        // Handle app inactive state
        break;
      case AppLifecycleState.paused:
        // Handle app paused state
        break;
      case AppLifecycleState.detached:
        // Handle app detached state
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
  }

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
              builder: (context, child) => CupertinoApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: App.navigatorKey,
                initialRoute: '/',
                theme: theme,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                onGenerateRoute: RouteList.router.onGenerate,
              ));
        });
  }
}
