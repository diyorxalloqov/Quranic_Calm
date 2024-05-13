import 'package:quranic_calm/modules/global/imports/app_imports.dart';

Future<bool> get hasInternet async {
  ConnectivityResult connectivityResult =
      await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.vpn) {
    return true;
  } else {
    return false;
  }
}
