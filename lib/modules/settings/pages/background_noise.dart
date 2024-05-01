import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/utils/extension/size.dart';

class BackgroundNoise extends StatefulWidget {
  const BackgroundNoise({super.key});

  @override
  State<BackgroundNoise> createState() => _SleepTimePageState();
}

class _SleepTimePageState extends State<BackgroundNoise> {
  bool isSleepTime = false;
  List<double> sliderValues = [0.1, 0.2, 0.3, 0.4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MainBackgroundWidget(
          mainWidget: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: wi(32)),
            child: SizedBox(
              width: context.width,
              height: context.height / 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: SvgPicture.asset(AppIcon.backButton)),
                          Text(
                            backgroundNoise,
                            style: TextStyle(
                                fontSize: AppSizes.size_20,
                                fontWeight: AppFontWeight.w_600,
                                fontFamily: AppfontFamily.abhaya.fontFamily),
                          ),
                          SizedBox(width: he(40)),
                        ],
                      ),
                      SizedBox(height: he(56)),
                      Container(
                        width: double.infinity,
                        constraints:
                            BoxConstraints(maxHeight: context.height / 2),
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: context.isDark
                                ? voiceContainerColor
                                : Colors.white),
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                                4,
                                (index) => Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                  color: mainGreenColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r)),
                                              child: SvgPicture.asset(
                                                  AppIcon.rain),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(width: wi(25)),
                                                    Text(
                                                      'Rain',
                                                      style: TextStyle(
                                                          color: context.isDark
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontFamily:
                                                              AppfontFamily
                                                                  .inter,
                                                          fontSize:
                                                              AppSizes.size_14,
                                                          fontWeight:
                                                              AppFontWeight
                                                                  .w_400),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: he(20),
                                                  child: Slider.adaptive(
                                                      value:
                                                          sliderValues[index],
                                                      inactiveColor:
                                                          mainBlueColor,
                                                      activeColor:
                                                          mainGreenColor,
                                                      thumbColor:
                                                          mainGreenColor,
                                                      onChanged: (v) {
                                                        setState(() {
                                                          sliderValues[index] =
                                                              v;
                                                        });
                                                      }),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        index == 4 - 1
                                            ? const SizedBox.shrink()
                                            : SizedBox(height: he(16))
                                      ],
                                    )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: context.bottom / 9 + 81),
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r)),
                                fixedSize: const Size(double.infinity, 48)),
                            child: Center(
                              child: Text(
                                savePref,
                                style: TextStyle(
                                    fontSize: AppSizes.size_20,
                                    color: context.isDark
                                        ? mainTextColor
                                        : Colors.white,
                                    fontWeight: AppFontWeight.w_600,
                                    fontFamily:
                                        AppfontFamily.abhaya.fontFamily),
                              ),
                            )),
                        SizedBox(height: he(24)),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(4.r)),
                                fixedSize: const Size(double.infinity, 48)),
                            child: Center(
                              child: Text(
                                startMediatations,
                                style: TextStyle(
                                    fontSize: AppSizes.size_20,
                                    color: context.isDark
                                        ? Colors.white
                                        : mainTextColor,
                                    fontWeight: AppFontWeight.w_600,
                                    fontFamily:
                                        AppfontFamily.abhaya.fontFamily),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
