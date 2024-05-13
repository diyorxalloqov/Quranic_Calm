import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class OnBoarding3 extends StatelessWidget {
  final PageController pageController;

  const OnBoarding3({super.key, required this.pageController});

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: context.isDark ? 1 : 0.4,
                child: Image.asset(AppImages.onboarding3,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                    width: 250),
              ),
              SizedBox(height: he(70))
            ],
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  SizedBox(height: he(80)),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: context.isDark ? 1 : 0.8,
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
                padding: EdgeInsets.only(left: wi(32), top: he(10)),
                child: Row(children: [
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
                  const Text(
                    '60 %',
                    style: TextStyle(
                        fontWeight: AppFontWeight.w_400,
                        fontSize: AppSizes.size_10,
                        fontFamily: AppfontFamily.inter),
                  ),
                ]),
              )),
              const SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.only(left: wi(54), right: wi(51)),
                child: Text(onboarding3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: AppfontFamily.inter,
                        color:
                            context.isDark ? mainTextColorDark : mainTextColor,
                        fontWeight: AppFontWeight.w_400,
                        fontSize: AppSizes.size_20)),
              ),
              const SizedBox(),
              SizedBox(height: he(100))
            ],
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
    );
  }
}
