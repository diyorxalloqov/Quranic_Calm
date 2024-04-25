import 'package:quranic_calm/modules/app.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  if (StorageRepository.getString(Keys.lang) == '') {
    await StorageRepository.putString(Keys.lang, 'uz');
  }
  runApp(EasyLocalization(
      saveLocale: true,
      startLocale: const Locale('uz'),
      supportedLocales: const [Locale("uz"), Locale("en")],
      path: "lib/core/lang",
      child: const App()));

  // portraitUp (vertikal) rejimida bo'lishi uchun
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // StatusBar Temasi
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}
