import 'package:quranic_calm/modules/favourites/bloc/favourite_bloc.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late FavouriteBloc favouriteBloc;

  @override
  void initState() {
    favouriteBloc = FavouriteBloc()..add(GetFavouritesItem());
    super.initState();
  }

  @override
  void dispose() {
    favouriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: favouriteBloc,
      child: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state.favouriteStatus == ActionStatus.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state.favouriteItems.isEmpty) {
            return Center(
                child: Text(favouriteItems,
                    style: TextStyle(
                        fontSize: AppSizes.size_20,
                        fontWeight: AppFontWeight.w_600,
                        fontFamily: AppfontFamily.abhaya.fontFamily)));
          } else if (state.favouriteStatus == ActionStatus.isSuccess) {
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
                        itemCount: state.favouriteItems.length + 1,
                        itemBuilder: (context, index) {
                          if (index == state.favouriteItems.length) {
                            return SizedBox(height: he(30));
                          }
                          return Card(
                            elevation: 0,
                            margin: EdgeInsets.symmetric(
                                horizontal: wi(32), vertical: wi(10.5)),
                            child: ListTile(
                              title: Text(
                                state.favouriteItems[index].itemName ?? '',
                                style: const TextStyle(
                                    fontSize: AppSizes.size_20,
                                    fontWeight: AppFontWeight.w_400,
                                    fontFamily: AppfontFamily.inter),
                              ),
                              subtitle: Text(
                                state.favouriteItems[index].itemDescription ??
                                    '',
                                style: const TextStyle(
                                    fontFamily: AppfontFamily.inter,
                                    fontSize: AppSizes.size_14,
                                    fontWeight: AppFontWeight.w_400),
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        favouriteBloc.add(FavouriteItemEvent(
                                            itemId: state.favouriteItems[index]
                                                    .itemId ??
                                                0,
                                            isFavourite: false));
                                      },
                                      child: SvgPicture.asset(
                                          AppIcon.favouriteGreen,
                                          color: context.isDark
                                              ? primaryColorBlack
                                              : null)),
                                  Text(
                                    state.favouriteItems[index].itemTime ?? '',
                                    style: const TextStyle(
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
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
