import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/onboarding/onboarding5.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wi(31)),
      child: Column(
        children: [
          SizedBox(height: he(28)),
          Center(
            child: Text(
              settings,
              style: TextStyle(
                  fontSize: AppSizes.size_20,
                  fontWeight: AppFontWeight.w_600,
                  fontFamily: AppfontFamily.abhaya.fontFamily),
            ),
          ),
          SizedBox(height: he(16)),
          Card(
            elevation: 0,
            child: ListTile(
                leading: SvgPicture.asset(AppIcon.notification,
                    color: context.isDark ? primaryColorBlack : null),
                title: Text(
                  notification,
                  style: TextStyle(
                    fontFamily: AppfontFamily.inter,
                    color: context.isDark ? Colors.white : mainTextColor,
                    fontSize: AppSizes.size_16,
                    fontWeight: AppFontWeight.w_400,
                  ),
                ),
                trailing: Transform.scale(
                  scale: 0.7,
                  child: Switch.adaptive(
                    focusColor: Colors.black,
                    activeColor: Colors.black,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white,
                    applyCupertinoTheme: true,
                    trackOutlineColor: const MaterialStatePropertyAll<Color>(
                        Color(0xff2C2E41)),
                    value: isNotificationEnabled,
                    onChanged: (v) {
                      isNotificationEnabled = v;
                      setState(() {});
                    },
                  ),
                )),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            child: Column(
              children: [
                ListTile(
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed('languagePage'),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r))),
                  leading: SvgPicture.asset(AppIcon.language,
                      color: context.isDark ? primaryColorBlack : null),
                  title: Text(
                    language,
                    style: TextStyle(
                      color: context.isDark ? Colors.white : mainTextColor,
                      fontFamily: AppfontFamily.inter,
                      fontSize: AppSizes.size_16,
                      fontWeight: AppFontWeight.w_400,
                    ),
                  ),
                ),
                Container(
                    color: Colors.black12, height: 1, width: double.infinity),
                ListTile(
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed('sleepTime'),
                  leading: SvgPicture.asset(AppIcon.clock,
                      color: context.isDark ? primaryColorBlack : null),
                  title: Text(
                    sleepTime,
                    style: TextStyle(
                      color: context.isDark ? Colors.white : mainTextColor,
                      fontFamily: AppfontFamily.inter,
                      fontSize: AppSizes.size_16,
                      fontWeight: AppFontWeight.w_400,
                    ),
                  ),
                ),
                Container(
                    color: Colors.black12, height: 1, width: double.infinity),
                ListTile(
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed('backgroundNoise'),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r))),
                  leading: SvgPicture.asset(AppIcon.settingsGreen,
                      color: context.isDark ? primaryColorBlack : null),
                  title: Text(
                    backgroundNoise,
                    style: TextStyle(
                      fontFamily: AppfontFamily.inter,
                      color: context.isDark ? Colors.white : mainTextColor,
                      fontSize: AppSizes.size_16,
                      fontWeight: AppFontWeight.w_400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Card(
              elevation: 0,
              child: ListTile(
                onTap: () => Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                              body: OnBoarding5(
                                  isSettingsPage: true,
                                  pageController: PageController()),
                            ))),
                leading: SvgPicture.asset(AppIcon.subscription,
                    color: context.isDark ? primaryColorBlack : null),
                title: Text(
                  subscription,
                  style: TextStyle(
                    fontFamily: AppfontFamily.inter,
                    color: context.isDark ? Colors.white : mainTextColor,
                    fontSize: AppSizes.size_16,
                    fontWeight: AppFontWeight.w_400,
                  ),
                ),
              )),
          const SizedBox(height: 10),
          Card(
              elevation: 0,
              child: ListTile(
                leading: SvgPicture.asset(AppIcon.subscription,
                    color: context.isDark ? primaryColorBlack : null),
                title: Text(
                  theme,
                  style: TextStyle(
                    fontFamily: AppfontFamily.inter,
                    color: context.isDark ? Colors.white : mainTextColor,
                    fontSize: AppSizes.size_16,
                    fontWeight: AppFontWeight.w_400,
                  ),
                ),
                trailing: Transform.scale(
                  scale: 0.7,
                  child: Switch.adaptive(
                    focusColor: Colors.black,
                    activeColor: Colors.black,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white,
                    applyCupertinoTheme: true,
                    trackOutlineColor: const MaterialStatePropertyAll<Color>(
                        Color(0xff2C2E41)),
                    value: Platform.isIOS
                        ? CupertinoAdaptiveTheme.of(context).mode.isDark
                        : AdaptiveTheme.of(context).mode.isDark,
                    onChanged: (value) {
                      if (value) {
                        Platform.isIOS
                            ? CupertinoAdaptiveTheme.of(context).setDark()
                            : AdaptiveTheme.of(context).setDark();
                      } else {
                        Platform.isIOS
                            ? CupertinoAdaptiveTheme.of(context).setLight()
                            : AdaptiveTheme.of(context).setLight();
                      }
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
