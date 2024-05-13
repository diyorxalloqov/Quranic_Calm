import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/settings/widgets/background_noise_widget.dart';

class BackgroundNoise extends StatefulWidget {
  const BackgroundNoise({super.key});

  @override
  State<BackgroundNoise> createState() => _SleepTimePageState();
}

class _SleepTimePageState extends State<BackgroundNoise> {
  bool isSleepTime = false;
  List<double> sliderValues =
      StorageRepository.getdoubleList(Keys.backgroundNoisesValue);
  List<bool> enabledValues =
      StorageRepository.getBoolList(Keys.backgroundNoises);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<MediatationBloc, MediatationState>(
        builder: (context, state) {
          return MainBackgroundWidget(
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
                                  child: SvgPicture.asset(AppIcon.backButton,
                                      color: context.isDark
                                          ? Colors.white
                                          : null)),
                              Text(
                                backgroundNoise,
                                style: TextStyle(
                                    fontSize: AppSizes.size_20,
                                    fontWeight: AppFontWeight.w_600,
                                    fontFamily:
                                        AppfontFamily.abhaya.fontFamily),
                              ),
                              SizedBox(width: wi(20)),
                            ],
                          ),
                          SizedBox(height: he(56)),
                          BackgroundNoiseWidgetSlider(
                              state: state, sliderValues: sliderValues)
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: context.bottom / 9 + 61),
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  await StorageRepository.putdoubleList(
                                      Keys.backgroundNoisesValue, sliderValues);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    fixedSize: const Size(double.infinity, 48)),
                                child: Center(
                                  child: Text(
                                    savePref,
                                    style: TextStyle(
                                        fontSize: AppSizes.size_20,
                                        color: Colors.white,
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
          ));
        },
      ),
    );
  }
}
