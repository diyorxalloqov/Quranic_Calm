import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/utils/extension/size.dart';
import 'package:quranic_calm/utils/extension/theme.dart';

class OnBoarding5 extends StatefulWidget {
  final PageController pageController;
  const OnBoarding5({super.key, required this.pageController});

  @override
  State<OnBoarding5> createState() => _OnBoarding4State();
}

class _OnBoarding4State extends State<OnBoarding5> {
  bool isFirstContainerSelected = true;
  bool isSecondContainerSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: appBackgroundGradient)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: 0.4,
                child: Image.asset(AppImages.leafLeft,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                    width: 200),
              ),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 0.4,
                    child: Image.asset(AppImages.leafRight,
                        alignment: Alignment.topLeft,
                        fit: BoxFit.cover,
                        width: 250),
                  ),
                ],
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(left: 32.w, top: 10.h),
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: mainGreenColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: mainGreenColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: mainGreenColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: mainGreenColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: mainGreenColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  Text(
                    '100 %',
                    style: TextStyle(
                        fontWeight: AppFontWeight.w_400,
                        fontSize: AppSizes.size_10,
                        fontFamily: AppfontFamily.inter.fontFamily),
                  ),
                ]),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      onboarding51,
                      style: TextStyle(
                          fontWeight: AppFontWeight.w_600,
                          fontSize: AppSizes.size_20,
                          fontFamily: AppfontFamily.abhaya.fontFamily),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      onboarding52,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFontWeight.w_600,
                          fontSize: AppSizes.size_20,
                          fontFamily: AppfontFamily.abhaya.fontFamily),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            '✧ $onboarding53',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: AppfontFamily.inter.fontFamily,
                                fontSize: AppSizes.size_16,
                                fontWeight: AppFontWeight.w_400),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Flexible(
                          child: Text(
                            '✧ $onboarding54',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: AppfontFamily.inter.fontFamily,
                                fontSize: AppSizes.size_16,
                                fontWeight: AppFontWeight.w_400),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Flexible(
                          child: Text(
                            '✧ $onboarding55',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: AppfontFamily.inter.fontFamily,
                                fontSize: AppSizes.size_16,
                                fontWeight: AppFontWeight.w_400),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFirstContainerSelected = true;
                              isSecondContainerSelected = false;
                            });
                          },
                          child: Container(
                            height: he(54),
                            margin: EdgeInsets.only(bottom: 20, top: he(112)),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: isFirstContainerSelected
                                    ? Border.all(color: Colors.black, width: 1)
                                    : Border.all(
                                        width: 1,
                                        color: context.isDark
                                            ? Colors.transparent
                                            : Colors.white),
                                borderRadius: BorderRadius.circular(4.r),
                                color: context.isDark
                                    ? Colors.black
                                    : Colors.white),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              leading: Container(
                                margin: const EdgeInsets.only(left: 5),
                                height: 22.r,
                                width: 22.r,
                                padding: const EdgeInsets.all(4),
                                decoration: ShapeDecoration(
                                    color: isFirstContainerSelected
                                        ? Colors.black
                                        : Colors.white,
                                    shape: const OvalBorder(
                                        side: BorderSide(
                                            color: Colors.black, width: 1))),
                              ),
                              title: Text(
                                onboarding56,
                                style: TextStyle(
                                    fontFamily: AppfontFamily.abhaya.fontFamily,
                                    fontSize: AppSizes.size_20,
                                    fontWeight: AppFontWeight.w_600,
                                    color: context.isDark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              trailing: Text(
                                '\$29.99 (save 20%)',
                                style: TextStyle(
                                    fontFamily: AppfontFamily.inter.fontFamily,
                                    fontSize: AppSizes.size_12,
                                    fontWeight: AppFontWeight.w_400,
                                    color: context.isDark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFirstContainerSelected = false;
                              isSecondContainerSelected = true;
                            });
                          },
                          child: Container(
                            height: he(54),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: isSecondContainerSelected
                                    ? Border.all(color: Colors.black, width: 1)
                                    : Border.all(
                                        width: 1,
                                        color: context.isDark
                                            ? Colors.transparent
                                            : Colors.white),
                                borderRadius: BorderRadius.circular(4.r),
                                color: context.isDark
                                    ? Colors.black
                                    : Colors.white),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              leading: Container(
                                margin: const EdgeInsets.only(left: 5),
                                height: 22.r,
                                width: 22.r,
                                padding: const EdgeInsets.all(4),
                                decoration: ShapeDecoration(
                                    color: isSecondContainerSelected
                                        ? Colors.black
                                        : Colors.white,
                                    shape: const OvalBorder(
                                        side: BorderSide(
                                            color: Colors.black, width: 1))),
                              ),
                              title: Text(
                                onboarding57,
                                style: TextStyle(
                                    fontFamily: AppfontFamily.abhaya.fontFamily,
                                    fontSize: AppSizes.size_20,
                                    fontWeight: AppFontWeight.w_600,
                                    color: context.isDark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              trailing: Text(
                                '\$29.99',
                                style: TextStyle(
                                    fontFamily: AppfontFamily.inter.fontFamily,
                                    fontSize: AppSizes.size_12,
                                    fontWeight: AppFontWeight.w_400,
                                    color: context.isDark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      onboarding58,
                      style: TextStyle(
                          fontFamily: AppfontFamily.abhaya.fontFamily,
                          fontSize: AppSizes.size_20,
                          fontWeight: AppFontWeight.w_600),
                    ),
                    Transform.scale(
                      scale: 0.7,
                      child: Switch.adaptive(
                        focusColor: Colors.black,
                        activeColor: Colors.black,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        applyCupertinoTheme: true,
                        trackOutlineColor:
                            const MaterialStatePropertyAll<Color>(
                                Color(0xff2C2E41)),
                        value: true,
                        onChanged: (v) {
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 100.h),
              const SizedBox(height: 45),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 32, right: 34, bottom: context.bottom / 9 + 56),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                        fixedSize: Size(double.infinity, 48.h)),
                    child: Center(
                      child: Text(
                        continuee,
                        style: TextStyle(
                            fontWeight: AppFontWeight.w_600,
                            fontSize: AppSizes.size_20,
                            fontFamily: AppfontFamily.abhaya.fontFamily,
                            color: Colors.white),
                      ),
                    )),
                const SizedBox(height: 5),
                TextButton(
                    onPressed: () async {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'bottomNavBar', (route) => false);
                      await StorageRepository.putBool(Keys.isOnboarding, true);
                    },
                    child: Text(
                      home,
                      style: TextStyle(
                          fontSize: AppSizes.size_20,
                          color: context.isDark ? Colors.white : Colors.black,
                          fontFamily: AppfontFamily.abhaya.fontFamily,
                          fontWeight: AppFontWeight.w_600),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
