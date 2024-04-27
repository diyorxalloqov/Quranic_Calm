import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/utils/extension/size.dart';

class OnBoarding1 extends StatelessWidget {
  final PageController pageController;
  const OnBoarding1({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: appBackgroundGradient)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 0.3,
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
                padding: EdgeInsets.only(left: 32.w, top: 10.h),
                child: Row(
                  children: [
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
                          color: mainBlueColor),
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
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.r),
                          color: mainBlueColor),
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
                    Text(
                      '20 %',
                      style: TextStyle(
                          fontWeight: AppFontWeight.w_400,
                          fontSize: AppSizes.size_10,
                          fontFamily: AppfontFamily.inter.fontFamily),
                    ),
                  ],
                ),
              )),
              Padding(
                padding: EdgeInsets.only(left: 54.w, top: 50.h, right: 51.w),
                child: Text(onboarding1,
                    textAlign: TextAlign.center, style: mainTextStyle),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: 0.3,
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
