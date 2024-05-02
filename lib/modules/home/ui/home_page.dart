import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/home/ui/widgets/category_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: BlocBuilder<MediatationBloc, MediatationState>(
          builder: (context, state) {
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
                        SizedBox(height: context.height / 2),
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
                                    context.isDark ? darkColor : Colors.white,
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
                                  color: context.isDark
                                      ? primaryColorBlack
                                      : mainGreenColor,
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
                          CategoryWidget(state: state)
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ),
      );
}
