import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/global/widgets/toast_widget.dart';

class OnBoarding4 extends StatefulWidget {
  final PageController pageController;

  const OnBoarding4({super.key, required this.pageController});

  @override
  State<OnBoarding4> createState() => _OnBoarding4State();
}

class _OnBoarding4State extends State<OnBoarding4> {
  List<bool> isTappedItems = [true, true, true, true];
  List<double> backgroundNoisesValue = [0.0, 0.0, 0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediatationBloc, MediatationState>(
      builder: (context, state) {
        if (state.votesStatus == ActionStatus.isSuccess) {
          isTappedItems =
              List<bool>.generate(state.votesModel.length, (index) => true);
          backgroundNoisesValue =
              List<double>.generate(state.votesModel.length, (index) => 0.5);
        }
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
                    children: <Widget>[
                      SizedBox(height: he(61)),
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
                      SizedBox(height: he(40)),
                      BackgroundNoiseWidget(
                          isTappedItems: isTappedItems, state: state)
                    ],
                  ),
                  const SizedBox(),
                  SizedBox(height: he(200)),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 32, right: 34, bottom: context.bottom / 9 + 56),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          if (state.votesModel.isNotEmpty) {
                            widget.pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                            await StorageRepository.putBoolList(
                                Keys.backgroundNoises, isTappedItems);
                            await StorageRepository.putdoubleList(
                                Keys.backgroundNoisesValue,
                                backgroundNoisesValue);
                            debugPrint('$isTappedItems');
                            debugPrint(
                                "${StorageRepository.getBoolList(Keys.backgroundNoises)}");
                          } else {
                            showToastMessage(wait, context);
                          }
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
                    const SizedBox(height: 5),
                    TextButton(
                        onPressed: () async {
                          widget.pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                          await StorageRepository.putBoolList(
                              Keys.backgroundNoises, isTappedItems);
                          await StorageRepository.putdoubleList(
                              Keys.backgroundNoisesValue,
                              backgroundNoisesValue);
                          debugPrint('$isTappedItems');
                          debugPrint(
                              "${StorageRepository.getBoolList(Keys.backgroundNoises)}");
                        },
                        child: Text(
                          skip,
                          style: TextStyle(
                              fontSize: AppSizes.size_20,
                              color:
                                  context.isDark ? Colors.white : Colors.black,
                              fontFamily: AppfontFamily.abhaya.fontFamily,
                              fontWeight: AppFontWeight.w_600),
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BackgroundNoiseWidget extends StatefulWidget {
  final MediatationState state;
  final List<bool> isTappedItems;
  const BackgroundNoiseWidget(
      {super.key, required this.isTappedItems, required this.state});

  @override
  State<BackgroundNoiseWidget> createState() => _BackgroundNoiseWidgetState();
}

class _BackgroundNoiseWidgetState extends State<BackgroundNoiseWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.state.votesStatus == ActionStatus.isSuccess) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: he(400)),
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: wi(32)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    widget.state.votesModel.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: he(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: context.isDark
                                            ? mainGreenColorDark
                                            : mainGreenColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: CachedNetworkImage(
                                        imageUrl: widget.state.votesModel[index]
                                                .voteIconUrl ??
                                            defaultIcon),
                                  ),
                                  SizedBox(width: wi(12)),
                                  Text(
                                    widget.state.votesModel[index].voteName ??
                                        '',
                                    style: const TextStyle(
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
                                      const MaterialStatePropertyAll<Color>(
                                          Color(0xff2C2E41)),
                                  value: widget.isTappedItems[index],
                                  onChanged: (v) {
                                    widget.isTappedItems[index] = v;
                                    setState(() {});
                                  },
                                ),
                              )
                            ],
                          ),
                        )),
              )),
        ),
      );
    } else {
      return widget.state.votesStatus == ActionStatus.isLoading
          ? const CircularProgressIndicator.adaptive()
          : Center(child: Text(widget.state.votesError));
    }
  }
}
