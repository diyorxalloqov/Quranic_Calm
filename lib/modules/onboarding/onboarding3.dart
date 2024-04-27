import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/utils/extension/size.dart';

class OnBoarding3 extends StatelessWidget {
  final PageController pageController;

  const OnBoarding3({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: appBackgroundGradient)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: 0.4,
                child: Image.asset(AppImages.onboarding3,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                    width: 250),
              ),
              SizedBox(height: 70.h)
            ],
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 0.8,
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
                    '60 %',
                    style: TextStyle(
                        fontWeight: AppFontWeight.w_400,
                        fontSize: AppSizes.size_10,
                        fontFamily: AppfontFamily.inter.fontFamily),
                  ),
                ]),
              )),
              const SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.only(left: 54.w, right: 51.w),
                child: Text(onboarding3,
                    textAlign: TextAlign.center, style: mainTextStyle),
              ),
              const SizedBox(),
              SizedBox(height: 100.h)
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
    );
  }
}
