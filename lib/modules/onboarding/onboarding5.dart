import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class OnBoarding5 extends StatefulWidget {
  final PageController pageController;
  final bool isSettingsPage;
  const OnBoarding5(
      {super.key, required this.isSettingsPage, required this.pageController});

  @override
  State<OnBoarding5> createState() => _OnBoarding4State();
}

class _OnBoarding4State extends State<OnBoarding5> {
  bool isFirstContainerSelected = true;
  bool isSecondContainerSelected = false;
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
                opacity: context.isDark ? 0.8 : 0.4,
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
                    opacity: context.isDark ? 0.8 : 0.4,
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
                padding: EdgeInsets.only(left: 32, top: he(10)),
                child: widget.isSettingsPage
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: SvgPicture.asset(AppIcon.backButton,
                                  color: context.isDark
                                      ? Colors.white.withOpacity(0.9)
                                      : null)),
                          Text(
                            subscription,
                            style: TextStyle(
                                fontSize: AppSizes.size_20,
                                fontWeight: AppFontWeight.w_600,
                                fontFamily: AppfontFamily.abhaya.fontFamily),
                          ),
                          const SizedBox(width: 20)
                        ],
                      )
                    : Row(children: [
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
                              color: context.isDark
                                  ? mainGreenColorDark
                                  : mainGreenColor),
                          margin: const EdgeInsets.only(right: 16),
                          height: 4,
                          width: wi(44),
                        ),
                        const Text(
                          '100 %',
                          style: TextStyle(
                              fontWeight: AppFontWeight.w_400,
                              fontSize: AppSizes.size_10,
                              fontFamily: AppfontFamily.inter),
                        ),
                      ]),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    widget.isSettingsPage
                        ? const SizedBox.shrink()
                        : Text(
                            onboarding51,
                            style: TextStyle(
                                fontWeight: AppFontWeight.w_600,
                                fontSize: AppSizes.size_20,
                                fontFamily: AppfontFamily.abhaya.fontFamily),
                          ),
                    SizedBox(height: he(16)),
                    Text(
                      widget.isSettingsPage
                          ? settingsSubscriptionItem
                          : onboarding52,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFontWeight.w_600,
                          fontSize: AppSizes.size_20,
                          fontFamily: AppfontFamily.abhaya.fontFamily),
                    ),
                    SizedBox(height: he(20)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            '✧ $onboarding53',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: AppfontFamily.inter,
                                fontSize: AppSizes.size_16,
                                fontWeight: AppFontWeight.w_400),
                          ),
                        ),
                        SizedBox(height: he(10)),
                        Flexible(
                          child: Text(
                            '✧ $onboarding54',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: AppfontFamily.inter,
                                fontSize: AppSizes.size_16,
                                fontWeight: AppFontWeight.w_400),
                          ),
                        ),
                        SizedBox(height: he(10)),
                        Flexible(
                          child: Text(
                            '✧ $onboarding55',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: AppfontFamily.inter,
                                fontSize: AppSizes.size_16,
                                fontWeight: AppFontWeight.w_400),
                          ),
                        ),
                        widget.isSettingsPage
                            ? SizedBox(height: he(30))
                            : const SizedBox.shrink(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFirstContainerSelected = true;
                              isSecondContainerSelected = false;
                            });
                          },
                          child: Container(
                            height: he(54),
                            margin: EdgeInsets.only(bottom: 20, top: he(112)),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: isFirstContainerSelected
                                    ? Border.all(
                                        color: context.isDark
                                            ? mainGreenColorDark
                                            : Colors.black,
                                        width: 1)
                                    : Border.all(
                                        width: 1,
                                        color: context.isDark
                                            ? Colors.transparent
                                            : Colors.white),
                                borderRadius: BorderRadius.circular(4),
                                color: context.isDark
                                    ? const Color(0xff2B2B3B)
                                    : Colors.white),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              leading: Container(
                                margin: const EdgeInsets.only(left: 5),
                                height: 22,
                                width: 22,
                                padding: const EdgeInsets.all(4),
                                decoration: ShapeDecoration(
                                    color: isFirstContainerSelected
                                        ? context.isDark
                                            ? mainGreenColorDark
                                            : Colors.black
                                        : context.isDark
                                            ? const Color(0xff2B2B3B)
                                            : Colors.white,
                                    shape: OvalBorder(
                                        side: BorderSide(
                                            color: isFirstContainerSelected
                                                ? context.isDark
                                                    ? Colors.transparent
                                                    : Colors.black
                                                : context.isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                            width: 1))),
                              ),
                              title: Text(
                                onboarding56,
                                style: TextStyle(
                                    fontFamily: AppfontFamily.abhaya.fontFamily,
                                    fontSize: AppSizes.size_20,
                                    fontWeight: AppFontWeight.w_600,
                                    color: context.isDark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              trailing: Text(
                                '\$29.99 (save 20%)',
                                style: TextStyle(
                                    fontFamily: AppfontFamily.inter,
                                    fontSize: AppSizes.size_12,
                                    fontWeight: AppFontWeight.w_400,
                                    color: context.isDark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFirstContainerSelected = false;
                              isSecondContainerSelected = true;
                            });
                          },
                          child: Container(
                            height: he(54),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: isSecondContainerSelected
                                    ? Border.all(
                                        color: context.isDark
                                            ? mainGreenColorDark
                                            : Colors.black,
                                        width: 1)
                                    : Border.all(
                                        width: 1,
                                        color: context.isDark
                                            ? Colors.transparent
                                            : Colors.white),
                                borderRadius: BorderRadius.circular(4),
                                color: context.isDark
                                    ? const Color(0xff2B2B3B)
                                    : Colors.white),
                            child: Center(
                              child: ListTile(
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                leading: Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  height: 22,
                                  width: 22,
                                  padding: const EdgeInsets.all(4),
                                  decoration: ShapeDecoration(
                                      color: isSecondContainerSelected
                                          ? context.isDark
                                              ? mainGreenColorDark
                                              : Colors.black
                                          : context.isDark
                                              ? const Color(0xff2B2B3B)
                                              : Colors.white,
                                      shape: OvalBorder(
                                          side: BorderSide(
                                              color: isSecondContainerSelected
                                                  ? context.isDark
                                                      ? Colors.transparent
                                                      : Colors.black
                                                  : context.isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                              width: 1))),
                                ),
                                title: Text(
                                  onboarding57,
                                  style: TextStyle(
                                      fontFamily:
                                          AppfontFamily.abhaya.fontFamily,
                                      fontSize: AppSizes.size_20,
                                      fontWeight: AppFontWeight.w_600,
                                      color: context.isDark
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                trailing: Text(
                                  '\$29.99',
                                  style: TextStyle(
                                      fontFamily: AppfontFamily.inter,
                                      fontSize: AppSizes.size_12,
                                      fontWeight: AppFontWeight.w_400,
                                      color: context.isDark
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wi(32)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      onboarding58,
                      style: TextStyle(
                          fontFamily: AppfontFamily.abhaya.fontFamily,
                          fontSize: AppSizes.size_20,
                          fontWeight: AppFontWeight.w_600),
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
                        value: true,
                        onChanged: (v) {
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ),
              widget.isSettingsPage
                  ? const SizedBox.shrink()
                  : SizedBox(height: he(100)),
              const SizedBox(height: 45),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 32, right: 34, bottom: context.bottom / 9 + 56),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {},
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
                widget.isSettingsPage
                    ? const SizedBox.shrink()
                    : TextButton(
                        onPressed: () async {
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'bottomNavBar', (route) => false);
                          await StorageRepository.putBool(
                              Keys.isOnboarding, true);
                        },
                        child: Text(
                          home,
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
  }
}
