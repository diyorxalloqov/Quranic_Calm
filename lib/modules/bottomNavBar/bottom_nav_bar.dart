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
    MainBackgroundWidget(mainWidget: HomePage()),
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
            screens: _screens, onItemSelected: (value) {
      _currentIndex = value;
      setState(() {});
    },
            items: [
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
                _currentIndex == 0 ? AppIcon.favouriteBig : AppIcon.favourite),
          ),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
                _currentIndex == 1 ? AppIcon.homeBig : AppIcon.home),
          ),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
                _currentIndex == 2 ? AppIcon.settingsBig : AppIcon.settings),
          )
        ],
            confineInSafeArea: true,
            backgroundColor: context.isDark ? bottomNavbarBlack : Colors.white,
            resizeToAvoidBottomInset: true,
            handleAndroidBackButtonPress: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(21.0),
                colorBehindNavBar: Colors.white),
            popAllScreensOnTapOfSelectedTab: true,
            itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 200), curve: Curves.ease),
            screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200)),
            navBarStyle: NavBarStyle.simple)
        // Container(
        //   height: he(79),
        //   decoration: BoxDecoration(
        //       color: context.isDark ? bottomNavbarBlack : Colors.red,
        //       // boxShadow: const [
        //       //   BoxShadow(
        //       //       color: Colors.black26, spreadRadius: 0.1, blurRadius: 0.1)
        //       // ],
        //       borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(24.r),
        //           topRight: Radius.circular(24.r))),
        //   child: BottomNavigationBar(
        //     onTap: (v) {
        //       _currentIndex = v;
        //       setState(() {});
        //     },
        //     currentIndex: _currentIndex,
        //     backgroundColor: Colors.transparent,
        //     type: BottomNavigationBarType.fixed,
        //     elevation: 0,
        //     fixedColor: Colors.transparent,
        //     showSelectedLabels: false,
        //     showUnselectedLabels: false,
        //     items: [
        //       BottomNavigationBarItem(
        //           label: '',
        //           activeIcon: SvgPicture.asset(AppIcon.favouriteBig),
        //           icon: SvgPicture.asset(AppIcon.favourite)),
        //       BottomNavigationBarItem(
        //           label: '',
        //           activeIcon: SvgPicture.asset(AppIcon.homeBig),
        //           icon: SvgPicture.asset(AppIcon.home)),
        //       BottomNavigationBarItem(
        //           label: '',
        //           activeIcon: SvgPicture.asset(AppIcon.settingsBig),
        //           icon: SvgPicture.asset(AppIcon.settings))
        //     ],
        //   ),
        // )
        );
  }
} /*   */
