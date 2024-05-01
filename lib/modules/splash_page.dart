import 'package:flutter/material.dart';
import 'package:quranic_calm/core/constants/app/app_fontfamily.dart';
import 'package:quranic_calm/core/constants/app/app_fontweight.dart';
import 'package:quranic_calm/core/constants/app/app_sizes.dart';
import 'package:quranic_calm/core/constants/keys.dart';
import 'package:quranic_calm/core/db/shared_preferences.dart';
import 'package:quranic_calm/core/constants/size/size_config.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String routeName = StorageRepository.getBool(Keys.isOnboarding) == true
      ? 'bottomNavBar'
      : 'onBoarding';

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(
            context, routeName, (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(AppIcon.appLogo, width: 90),
            SizedBox(height: he(20)),
            Text(
              'Quranic Calm',
              style: TextStyle(
                  fontSize: AppSizes.size_24,
                  fontWeight: AppFontWeight.w_600,
                  fontFamily: AppfontFamily.comforta.fontFamily),
            ),
          ],
        ),
      )),
    );
  }
}
