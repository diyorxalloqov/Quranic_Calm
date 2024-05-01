import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: wi(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          image: const DecorationImage(
              image: AssetImage(AppImages.suggestionBack), fit: BoxFit.cover)),
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
            child: GestureDetector(onTap: () {}, child: const Icon(Icons.play_arrow)),
          )
        ],
      ),
    );
  }
}
