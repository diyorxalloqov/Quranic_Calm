import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: he(28)),
        Center(
            child: Text(
          favourites,
          style: TextStyle(
              fontSize: AppSizes.size_20,
              fontWeight: AppFontWeight.w_600,
              fontFamily: AppfontFamily.abhaya.fontFamily),
        )),
        SizedBox(height: he(12)),
        Expanded(
            child: ListView.builder(
                itemCount: 10 + 1,
                itemBuilder: (context, index) {
                  if (index == 10) {
                    return SizedBox(height: he(30));
                  }
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(
                        horizontal: wi(32), vertical: wi(10.5)),
                    child: ListTile(
                      title: Text(
                        'Baqara',
                        style: TextStyle(
                            fontSize: AppSizes.size_20,
                            fontWeight: AppFontWeight.w_400,
                            fontFamily: AppfontFamily.inter),
                      ),
                      subtitle: Text(
                        'Mishary Rashid',
                        style: TextStyle(
                            fontFamily: AppfontFamily.inter,
                            fontSize: AppSizes.size_14,
                            fontWeight: AppFontWeight.w_400),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(AppIcon.favouriteGreen,
                                  color: context.isDark
                                      ? primaryColorBlack
                                      : null)),
                          Text(
                            '45:00',
                            style: TextStyle(
                                fontFamily: AppfontFamily.inter,
                                fontSize: AppSizes.size_14,
                                fontWeight: AppFontWeight.w_400),
                          )
                        ],
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
