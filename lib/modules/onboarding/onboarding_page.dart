import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.leafLeft),
                alignment: Alignment.topCenter,
                opacity: 500),
            gradient: LinearGradient(colors: appBackgroundGradient)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(child: Text('asas')),
              Text(
                  'Purus mauris augue pharetra turpis sit. Tincidunt urna eget ac risus nunc enim risus nisl. ',
                  textAlign: TextAlign.center,
                  style: mainTextStyle),
              ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text(continuee),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
