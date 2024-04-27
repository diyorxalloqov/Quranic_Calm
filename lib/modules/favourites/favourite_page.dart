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
        const SizedBox(height: 28),
        Center(
            child: Text(
          favourites,
          style: TextStyle(
              fontSize: AppSizes.size_20,
              fontWeight: AppFontWeight.w_600,
              fontFamily: AppfontFamily.abhaya.fontFamily),
        )),
        Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(
                        horizontal: wi(32), vertical: wi(10)),
                    child: ListTile(
                      title: Text(
                        'Baqara',
                        style: TextStyle(
                            fontSize: AppSizes.size_20,
                            fontWeight: AppFontWeight.w_400,
                            fontFamily: AppfontFamily.inter.fontFamily),
                      ),
                      subtitle: Text(
                        'Mishary Rashid',
                        style: TextStyle(
                            fontFamily: AppfontFamily.inter.fontFamily,
                            fontSize: AppSizes.size_14,
                            fontWeight: AppFontWeight.w_400),
                      ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child:
                                  SvgPicture.asset(AppIcon.favouriteGreen)),
                          SizedBox(height: 12.h),
                          Text(
                            '45:00',
                            style: TextStyle(
                                fontFamily: AppfontFamily.inter.fontFamily,
                                fontSize: AppSizes.size_14,
                                fontWeight: AppFontWeight.w_400),
                          )
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
