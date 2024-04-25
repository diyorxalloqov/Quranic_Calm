import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quranic_calm/core/constants/app/app_fontfamily.dart';
import 'package:quranic_calm/core/constants/app/app_fontweight.dart';
import 'package:quranic_calm/core/constants/app/app_sizes.dart';
import 'package:quranic_calm/core/constants/keys.dart';
import 'package:quranic_calm/core/db/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String routeName = StorageRepository.getBool(Keys.isOnboarding) == true
      ? 'bottomNavbar'
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
          child: Container(
        // decoration: const BoxDecoration(
        // image: DecorationImage(
        //     image: AssetImage(AppImages.splash), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(AppIcon.appLogo, width: 90),
              SizedBox(height: 20.h),
              Text(
                'Quranic Calm',
                style: TextStyle(
                    fontSize: AppSizes.size_24,
                    fontWeight: AppFontWeight.w_600,
                    fontFamily: AppfontFamily.comforta.fontFamily),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
