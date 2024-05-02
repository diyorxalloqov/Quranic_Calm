import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class OnBoarding4 extends StatefulWidget {
  final PageController pageController;

  const OnBoarding4({super.key, required this.pageController});

  @override
  State<OnBoarding4> createState() => _OnBoarding4State();
}

class _OnBoarding4State extends State<OnBoarding4> {
  List<bool> isTappedItems = [true, true, true, true];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: context.isDark
                  ? appBackgroundGradientBlack
                  : appBackgroundGradient)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: he(100)),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: context.isDark ? 0.6 : 0.4,
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
                  SizedBox(height: he(80)),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: context.isDark ? 0.6 : 0.4,
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
                padding: EdgeInsets.only(left: 32.w, top: he(10)),
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: context.isDark
                            ? mainGreenColorDark
                            : mainGreenColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: context.isDark
                            ? mainGreenColorDark
                            : mainGreenColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: context.isDark
                            ? mainGreenColorDark
                            : mainGreenColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: context.isDark
                            ? mainGreenColorDark
                            : mainGreenColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: mainBlueColor),
                    margin: const EdgeInsets.only(right: 16),
                    height: 4,
                    width: 44.w,
                  ),
                  const Text(
                    '80 %',
                    style: TextStyle(
                        fontWeight: AppFontWeight.w_400,
                        fontSize: AppSizes.size_10,
                        fontFamily: AppfontFamily.inter),
                  ),
                ]),
              )),
              Column(
                children: [
                  Text(
                    onboarding41,
                    style: TextStyle(
                        fontWeight: AppFontWeight.w_600,
                        fontSize: AppSizes.size_20,
                        fontFamily: AppfontFamily.abhaya.fontFamily),
                  ),
                  SizedBox(height: he(11)),
                  Text(
                    onboarding42,
                    style: const TextStyle(
                        fontWeight: AppFontWeight.w_400,
                        fontSize: AppSizes.size_14,
                        fontFamily: AppfontFamily.inter),
                  ),
                  SizedBox(height: he(35)),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            4,
                            (index) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: he(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: context.isDark
                                                    ? mainGreenColorDark
                                                    : mainGreenColor,
                                                borderRadius:
                                                    BorderRadius.circular(8.r)),
                                            child:
                                                SvgPicture.asset(AppIcon.rain),
                                          ),
                                          SizedBox(width: 12.w),
                                          const Text(
                                            'rain',
                                            style: TextStyle(
                                                fontFamily: AppfontFamily.inter,
                                                fontWeight: AppFontWeight.w_400,
                                                fontSize: AppSizes.size_14),
                                          )
                                        ],
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
                                              const MaterialStatePropertyAll<
                                                  Color>(Color(0xff2C2E41)),
                                          value: isTappedItems[index],
                                          onChanged: (v) {
                                            isTappedItems[index] = v;
                                            setState(() {});
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                      )),
                ],
              ),
              const SizedBox(),
              SizedBox(height: he(200)),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 32, right: 34, bottom: context.bottom / 9 + 56),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                        fixedSize: const Size(double.infinity, 48)),
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
                    onPressed: () {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      skip,
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
