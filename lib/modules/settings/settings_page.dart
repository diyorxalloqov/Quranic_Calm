import 'package:quranic_calm/modules/global/imports/app_imports.dart';

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
          const SizedBox(height: 28),
          Center(
            child: Text(
              settings,
              style: TextStyle(
                  fontSize: AppSizes.size_20,
                  fontWeight: AppFontWeight.w_600,
                  fontFamily: AppfontFamily.abhaya.fontFamily),
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
                leading: SvgPicture.asset(AppIcon.notification),
                title: Text(
                  notification,
                  style: TextStyle(
                    fontFamily: AppfontFamily.inter.fontFamily,
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
                  onTap: () {},
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r))),
                  leading: SvgPicture.asset(AppIcon.language),
                  title: Text(
                    language,
                    style: TextStyle(
                      fontFamily: AppfontFamily.inter.fontFamily,
                      fontSize: AppSizes.size_16,
                      fontWeight: AppFontWeight.w_400,
                    ),
                  ),
                ),
                // const Divider(),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(AppIcon.clock),
                  title: Text(
                    sleepTime,
                    style: TextStyle(
                      fontFamily: AppfontFamily.inter.fontFamily,
                      fontSize: AppSizes.size_16,
                      fontWeight: AppFontWeight.w_400,
                    ),
                  ),
                ),
                // const Divider(),
                ListTile(
                  onTap: () {},
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r))),
                  leading: SvgPicture.asset(AppIcon.settingsGreen),
                  title: Text(
                    backgroundNoise,
                    style: TextStyle(
                      fontFamily: AppfontFamily.inter.fontFamily,
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
                onTap: () {},
                leading: SvgPicture.asset(AppIcon.subscription),
                title: Text(
                  subscription,
                  style: TextStyle(
                    fontFamily: AppfontFamily.inter.fontFamily,
                    fontSize: AppSizes.size_16,
                    fontWeight: AppFontWeight.w_400,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
