import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class MainBackgroundWidget extends StatelessWidget {
  final Widget mainWidget;
  const MainBackgroundWidget({super.key, required this.mainWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: context.isDark
                  ? appBackgroundGradientBlack
                  : appBackgroundGradient)),
      child: Stack(
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
          Column(
            children: [
              SizedBox(height: he(80)),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: context.isDark ? 0.8 : 0.4,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(AppImages.leafRight,
                      alignment: Alignment.topRight,
                      fit: BoxFit.cover,
                      width: 250),
                ),
              ),
            ],
          ),
          Positioned(child: mainWidget)
        ],
      ),
    );
  }
}
