import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/utils/extension/size.dart';

showVoiceChangerBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const VoiceChangerBottomSheet());
}

class VoiceChangerBottomSheet extends StatefulWidget {
  const VoiceChangerBottomSheet({super.key});

  @override
  State<VoiceChangerBottomSheet> createState() =>
      _VoiceChangerBottomSheetState();
}

class _VoiceChangerBottomSheetState extends State<VoiceChangerBottomSheet> {
  bool isSleepTime = false;
  List<double> sliderValues = [0.1, 0.2, 0.3, 0.4];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: context.height / 1.2),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: context.isDark ? voiceContainerColor : Colors.white),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
              4,
              (index) => Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: mainGreenColor,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: SvgPicture.asset(AppIcon.rain),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontFamily: AppfontFamily.inter,
                                        fontSize: AppSizes.size_14,
                                        fontWeight: AppFontWeight.w_400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: he(20),
                                child: Slider.adaptive(
                                    value: sliderValues[index],
                                    inactiveColor: mainBlueColor,
                                    activeColor: mainGreenColor,
                                    thumbColor: mainGreenColor,
                                    onChanged: (v) {
                                      setState(() {
                                        sliderValues[index] = v;
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
    );
  }
}
