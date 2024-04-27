import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/onboarding/onboarding1.dart';
import 'package:quranic_calm/modules/onboarding/onboarding2.dart';
import 'package:quranic_calm/modules/onboarding/onboarding3.dart';
import 'package:quranic_calm/modules/onboarding/onboarding4.dart';
import 'package:quranic_calm/modules/onboarding/onboarding5.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      OnBoarding1(pageController: pageController),
      OnBoarding2(pageController: pageController),
      OnBoarding3(pageController: pageController),
      OnBoarding4(pageController: pageController),
      OnBoarding5(pageController: pageController),
    ];
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          onPageChanged: (v) {
            setState(() {});
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return _pages[index];
          }),
    );
  }
}
