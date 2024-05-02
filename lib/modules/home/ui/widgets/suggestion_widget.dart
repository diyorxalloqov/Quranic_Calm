import 'dart:math';

import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _randomImages = [
      AppImages.suggestionBack,
      AppImages.suggestionBack1,
      AppImages.suggestionBack2,
      AppImages.suggestionBack3
    ];
    final int _randomIndex = Random().nextInt(_randomImages.length);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: wi(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          image: DecorationImage(
              image: AssetImage(_randomImages[_randomIndex]),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Baqara',
                style: TextStyle(
                    fontSize: AppSizes.size_16,
                    color: Colors.white,
                    fontFamily: AppfontFamily.inter,
                    fontWeight: AppFontWeight.w_400),
              ),
              Text(
                'Mishary Rashid',
                style: TextStyle(
                    fontSize: AppSizes.size_10,
                    color: Colors.white,
                    fontFamily: AppfontFamily.inter,
                    fontWeight: AppFontWeight.w_400),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            padding: const EdgeInsets.all(6.0),
            decoration:
                const ShapeDecoration(shape: OvalBorder(), color: Colors.white),
            child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.play_arrow, color: Colors.black)),
          )
        ],
      ),
    );
  }
}
