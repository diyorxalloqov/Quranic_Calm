import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/home/ui/widgets/sleepTimer_bottom_sheet.dart';
import 'package:quranic_calm/modules/home/ui/widgets/voice_changer_bottom_sheet.dart';
import 'package:quranic_calm/utils/extension/size.dart';

class SuraDetailsPage extends StatelessWidget {
  const SuraDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: appBackgroundGradient),
            image: const DecorationImage(
                image: AssetImage(AppImages.clouds),
                alignment: Alignment.bottomCenter)),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SvgPicture.asset(AppIcon.backButton)),
                  Text(
                    'Baqara',
                    style: TextStyle(
                        fontSize: AppSizes.size_20,
                        fontWeight: AppFontWeight.w_600,
                        fontFamily: AppfontFamily.abhaya.fontFamily),
                  ),
                  GestureDetector(
                      onTap: () {}, child: SvgPicture.asset(AppIcon.favourite)),
                ],
              ),
              const Spacer(),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(AppIcon.previous),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: ShapeDecoration(
                          color: mainPurpleColor, shape: const OvalBorder()),
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppIcon.pause),
                        // Icon(Icons.play_arrow)
                      ),
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(AppIcon.next),
                    )
                  ],
                ),
                SizedBox(height: he(24)),
                GestureDetector(
                  onTap: () => showSleepTimerBottomSheet(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: he(10), horizontal: wi(20)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: mainPurpleColor),
                    child: const Text(
                      '30 minute',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppfontFamily.inter,
                          fontSize: AppSizes.size_20,
                          fontWeight: AppFontWeight.w_400),
                    ),
                  ),
                ),
                SizedBox(height: he(30)),
                IconButton(
                    onPressed: () => showVoiceChangerBottomSheet(context),
                    icon: SvgPicture.asset(AppIcon.volume)),
                SizedBox(height: he(10)),
                Text(setNoise,
                    style: const TextStyle(
                        fontFamily: AppfontFamily.inter,
                        fontWeight: AppFontWeight.w_700,
                        fontSize: AppSizes.size_10))
              ]),
              SizedBox(height: context.bottom / 9 + 75)
            ],
          ),
        ),
      ),
    );
  }
}
