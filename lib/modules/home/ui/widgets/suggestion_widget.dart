import 'dart:math';

import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class SuggestionWidget extends StatefulWidget {
  final int index;
  final MediatationState state;
  const SuggestionWidget({super.key, required this.state, required this.index});

  @override
  State<SuggestionWidget> createState() => _SuggestionWidgetState();
}

class _SuggestionWidgetState extends State<SuggestionWidget> {
  final List<String> randomImages = [
    AppImages.suggestionBack,
    AppImages.suggestionBack1,
    AppImages.suggestionBack2,
    AppImages.suggestionBack3
  ];

  final int _randomIndex = Random().nextInt(4);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .pushNamed('suraDetailsPage', arguments: widget.index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        margin: EdgeInsets.symmetric(horizontal: wi(8)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: AssetImage(randomImages[_randomIndex]),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.state.suggestionItems[widget.index].itemName ?? '',
                  style: const TextStyle(
                      fontSize: AppSizes.size_16,
                      color: Colors.white,
                      fontFamily: AppfontFamily.inter,
                      fontWeight: AppFontWeight.w_400),
                ),
                Text(
                  widget.state.suggestionItems[widget.index].itemDescription ??
                      '',
                  style: const TextStyle(
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
              decoration: const ShapeDecoration(
                  shape: OvalBorder(), color: Colors.white),
              child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.play_arrow, color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
