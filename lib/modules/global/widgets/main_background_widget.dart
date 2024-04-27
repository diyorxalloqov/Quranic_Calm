import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class MainBackgroundWidget extends StatelessWidget {
  final Widget mainWidget;
  const MainBackgroundWidget({super.key, required this.mainWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: appBackgroundGradient)),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: 0.4,
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
                  SizedBox(height: 80.h),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 0.4,
                    child: Image.asset(AppImages.leafRight,
                        alignment: Alignment.topRight,
                        fit: BoxFit.cover,
                        width: 250),
                  ),
                ],
              )),
          Positioned(child: mainWidget)
        ],
      ),
    );
  }
}
