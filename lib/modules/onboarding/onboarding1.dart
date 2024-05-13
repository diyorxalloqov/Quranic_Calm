import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class OnBoarding1 extends StatelessWidget {
  final PageController pageController;
  const OnBoarding1({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: context.isDark
                  ? appBackgroundGradientBlack
                  : appBackgroundGradient)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: context.isDark ? 0.6 : 0.3,
              child: Image.asset(
                AppImages.leafLeft,
                alignment: Alignment.center,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(left: wi(32), top: he(10)),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: context.isDark
                              ? mainGreenColorDark
                              : mainGreenColor),
                      margin: const EdgeInsets.only(right: 16),
                      height: 4,
                      width: wi(44),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: mainBlueColor),
                      margin: const EdgeInsets.only(right: 16),
                      height: 4,
                      width: wi(44),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: mainBlueColor),
                      margin: const EdgeInsets.only(right: 16),
                      height: 4,
                      width: wi(44),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: mainBlueColor),
                      margin: const EdgeInsets.only(right: 16),
                      height: 4,
                      width: wi(44),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: mainBlueColor),
                      margin: const EdgeInsets.only(right: 16),
                      height: 4,
                      width: wi(44),
                    ),
                    const Text(
                      '20 %',
                      style: TextStyle(
                          fontWeight: AppFontWeight.w_400,
                          fontSize: AppSizes.size_10,
                          fontFamily: AppfontFamily.inter),
                    ),
                  ],
                ),
              )),
              Padding(
                padding:
                    EdgeInsets.only(left: wi(54), top: he(50), right: wi(51)),
                child: Text(onboarding1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: AppfontFamily.inter,
                        color:
                            context.isDark ? mainTextColorDark : mainTextColor,
                        fontWeight: AppFontWeight.w_400,
                        fontSize: AppSizes.size_20)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: context.isDark ? 0.6 : 0.3,
                        child: Image.asset(AppImages.leafRight,
                            alignment: Alignment.center)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 32, right: 34, bottom: context.bottom / 9 + 77),
                    child: ElevatedButton(
                        onPressed: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
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
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
