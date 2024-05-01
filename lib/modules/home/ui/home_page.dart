import 'dart:ui';

import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MediatationBloc, MediatationState>(
        builder: (context, state) {
          _tabController =
              TabController(length: state.categoryModel.length, vsync: this);
          return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: appBackgroundGradient)),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: context.height / 2),
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
                  Column(
                    children: [
                      SizedBox(height: he(80)),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: 0.4,
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
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: he(56)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            recently,
                            style: TextStyle(
                                fontSize: AppSizes.size_20,
                                fontFamily: AppfontFamily.abhaya.fontFamily,
                                fontWeight: AppFontWeight.w_600),
                          ),
                        ),
                        SizedBox(height: he(16)),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          margin: const EdgeInsets.symmetric(horizontal: 32),
                          decoration: BoxDecoration(
                              color:
                                  context.isDark ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Baqara',
                                style: TextStyle(
                                    fontSize: AppSizes.size_20,
                                    fontFamily: AppfontFamily.inter,
                                    fontWeight: AppFontWeight.w_400),
                              ),
                              SizedBox(height: he(8)),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mishary Rashid',
                                      style: TextStyle(
                                          fontSize: AppSizes.size_14,
                                          fontFamily: AppfontFamily.inter,
                                          fontWeight: AppFontWeight.w_400)),
                                  Text('05:34',
                                      style: TextStyle(
                                          fontSize: AppSizes.size_16,
                                          fontFamily: AppfontFamily.inter,
                                          fontWeight: AppFontWeight.w_400)),
                                ],
                              ),
                              SizedBox(height: he(12)),
                              LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(6.r),
                                backgroundColor: mainBlueColor,
                                color: mainGreenColor,
                                value: 0.56,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: he(19)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            suggestions,
                            style: TextStyle(
                                fontSize: AppSizes.size_20,
                                color: context.isDark
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: AppfontFamily.abhaya.fontFamily,
                                fontWeight: AppFontWeight.w_600),
                          ),
                        ),
                        SizedBox(height: he(16)),
                        ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: he(130)),
                            child: ListView.builder(
                                itemCount: 20,
                                padding:
                                    EdgeInsets.symmetric(horizontal: wi(24)),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return const SuggestionWidget();
                                })),
                        SizedBox(height: he(24)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            categories,
                            style: TextStyle(
                                fontSize: AppSizes.size_20,
                                color: context.isDark
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: AppfontFamily.abhaya.fontFamily,
                                fontWeight: AppFontWeight.w_600),
                          ),
                        ),
                        SizedBox(height: he(16)),
                        state.status == ActionStatus.isSuccess
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TabBar(
                                      indicatorColor: Colors.transparent,
                                      unselectedLabelColor: Colors.black,
                                      labelColor: Colors.black,
                                      labelPadding:
                                          const EdgeInsets.only(left: 16),
                                      dividerColor: Colors.transparent,
                                      padding: const EdgeInsets.only(left: 12),
                                      splashBorderRadius:
                                          BorderRadius.circular(24.r),
                                      indicator: ShapeDecoration(
                                        color: mainGreenColor,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: mainGreenColor,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(24.r)),
                                      ),
                                      labelStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: AppfontFamily.inter),
                                      unselectedLabelStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: AppfontFamily.inter),
                                      controller: _tabController,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      isScrollable: true,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 1),
                                      tabAlignment: TabAlignment.start,
                                      tabs: List.generate(
                                          state.categoryModel.length,
                                          (index) => InkWell(
                                                onTap: () => _tabController
                                                    .animateTo(index,
                                                        curve: Curves.easeIn),
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.transparent,
                                                child: Tab(
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 24,
                                                        vertical: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.r),
                                                      border: Border.all(
                                                          color: mainGreenColor,
                                                          width: 1),
                                                    ),
                                                    child: Text(state
                                                        .categoryModel[index]
                                                        .categoryName
                                                        .toString()),
                                                  ),
                                                ),
                                              ))),
                                  ListView.builder(
                                      itemCount: 114,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 32),
                                      itemBuilder: (context, index) {
                                        return CardWidget(
                                          suraData: SuraData(
                                              leading: numbers[index],
                                              title: 'Fotiha',
                                              index: index,
                                              subtitle: 'Mishary Rashid',
                                              trailing: '01:34'),
                                        );
                                      }),
                                ],
                              )
                            : state.status == ActionStatus.isLoading
                                ? SizedBox(
                                    height: he(
                                        Platform.isAndroid || Platform.isIOS
                                            ? 350
                                            : 500),
                                    child: const Center(
                                        child: CircularProgressIndicator
                                            .adaptive()),
                                  )
                                : SizedBox(
                                    height: he(
                                        Platform.isAndroid || Platform.isIOS
                                            ? 350
                                            : 500),
                                    child: Center(child: Text(state.error)))

                        // TabBarView(
                        //     controller: _tabController,
                        //     children: List.generate(
                        //         3,
                        //         (index) => ListView.builder(
                        //             itemCount: 114,
                        //             shrinkWrap: true,
                        //             physics: const NeverScrollableScrollPhysics(),
                        //             padding: const EdgeInsets.only(top: 32),
                        //             itemBuilder: (context, index) {
                        //               return CardWidget(index: index);
                        //             }))),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
