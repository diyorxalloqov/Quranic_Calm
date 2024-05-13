import 'package:fluttertoast/fluttertoast.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';

void showToastMessage(String title, BuildContext context) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: context.isDark ? Colors.black : Colors.white,
      textColor: context.isDark ? Colors.white : Colors.black,
      fontSize: 16.0);
}
