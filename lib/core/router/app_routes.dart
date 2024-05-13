import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/home/ui/pages/sura_details_page.dart';
import 'package:quranic_calm/modules/settings/pages/language_page.dart';

class RouteList {
  static final RouteList _generate = RouteList._init();
  static RouteList get router => _generate;

  RouteList._init();
  int tappedPages = 0;

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const SplashPage());
      case 'onBoarding':
        return _navigate(const OnBoardingPage());
      case 'bottomNavBar':
        return _navigate(const BottomNavBar());
      case 'sleepTime':
        return _navigate(const SleepTimePage());
      case 'backgroundNoise':
        return _navigate(const BackgroundNoise());
      case "languagePage":
        return _navigate(const LanguagePage());
      case "suraDetailsPage":
        return _navigate(SuraDetailsPage(index: settings.arguments as int));
    }
    return null;
  }

  _navigate(Widget widget) {
    // tappedPages++;
    // print(tappedPages);
    // if (tappedPages == 6) {
    //   tappedPages = 0;
    //   loadAd();
    //   _interstitialAd?.show();
    // }
    return MaterialPageRoute(builder: (context) => widget);
  }

  // _interstitialAd?.dispose();
  ///               _interstitialAd?.show(); button bosilganda

  // bool isFullPageAdLoaded = false;
  // InterstitialAd? _interstitialAd;

  // void loadAd() {
  //   InterstitialAd.load(
  //     adUnitId: AdHelper.interstitialId(),
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (ad) {
  //           _interstitialAd = ad;
  //         },
  //         onAdFailedToLoad: (error) {}),
  //   );
  // }
}
