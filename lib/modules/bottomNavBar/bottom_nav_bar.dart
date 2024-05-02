import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screens = const [
    MainBackgroundWidget(mainWidget: FavouritePage()),
    HomePage(),
    MainBackgroundWidget(mainWidget: SettingsPage())
  ];
  late PersistentTabController _controller;
  int _currentIndex = 1;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: PersistentTabView(context,
            controller: _controller,
            navBarHeight: he(79),
            popAllScreensOnTapAnyTabs: true,
            screens: _screens, onItemSelected: (value) {
      _currentIndex = value;
      setState(() {});
    },
            items: [
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
                color: context.isDark ? Colors.white : null,
                _currentIndex == 0 ? AppIcon.favouriteBig : AppIcon.favourite),
          ),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
                color: context.isDark ? Colors.white : null,
                _currentIndex == 1 ? AppIcon.homeBig : AppIcon.home),
          ),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
                color: context.isDark ? Colors.white : null,
                _currentIndex == 2 ? AppIcon.settingsBig : AppIcon.settings),
          )
        ],
            backgroundColor: context.isDark ? bottomNavbarBlack : Colors.white,
            handleAndroidBackButtonPress: true,
            hideNavigationBarWhenKeyboardShows: true,
            popActionScreens: PopActionScreensType.once,
            decoration: NavBarDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r))),
            popAllScreensOnTapOfSelectedTab: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 200), curve: Curves.ease),
            screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200)),
            navBarStyle: NavBarStyle.simple));
  }
}
