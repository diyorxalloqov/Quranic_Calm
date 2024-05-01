import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _SleepTimePageState();
}

class _SleepTimePageState extends State<LanguagePage> {
  String selectedLang = StorageRepository.getString(Keys.lang);
  bool isSleepTime = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MainBackgroundWidget(
          mainWidget: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: wi(32)),
            child: SizedBox(
              width: context.width,
              height: context.height / 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: SvgPicture.asset(AppIcon.backButton)),
                          Text(
                            language,
                            style: TextStyle(
                                fontSize: AppSizes.size_20,
                                fontWeight: AppFontWeight.w_600,
                                fontFamily: AppfontFamily.abhaya.fontFamily),
                          ),
                          SizedBox(width: he(40)),
                        ],
                      ),
                      SizedBox(height: he(25)),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(right: wi(32)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: wi(12), vertical: he(13)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: selectedLang == 'uzbek'
                                      ? mainGreenColor.withOpacity(0.2)
                                      : context.isDark
                                          ? Colors.black
                                          : Colors.white,
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    selectedLang = 'uzbek';
                                    context.setLocale(const Locale('uz'));
                                    setState(() {});
                                  },
                                  child: Text(
                                    "Uzbek",
                                    style: TextStyle(
                                      color: selectedLang == 'uzbek'
                                          ? Colors.black
                                          : context.isDark
                                              ? Colors.white
                                              : Colors.black,
                                      fontSize: AppSizes.size_16,
                                      fontFamily: AppfontFamily.inter,
                                      fontWeight: AppFontWeight.w_500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin:
                                    EdgeInsets.only(right: wi(32), top: he(20)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: wi(12), vertical: he(13)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: selectedLang == 'english'
                                      ? mainGreenColor.withOpacity(0.2)
                                      : context.isDark
                                          ? Colors.black
                                          : Colors.white,
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    selectedLang = 'english';
                                    context.setLocale(const Locale('en'));
                                    setState(() {});
                                  },
                                  child: Text(
                                    "English",
                                    style: TextStyle(
                                      color: selectedLang == 'english'
                                          ? Colors.black
                                          : context.isDark
                                              ? Colors.white
                                              : Colors.black,
                                      fontSize: AppSizes.size_16,
                                      fontFamily: AppfontFamily.inter,
                                      fontWeight: AppFontWeight.w_500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: wi(12), vertical: he(25)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.r),
                                topRight: Radius.circular(24.r),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: context.bottom / 9 + 81, right: wi(32)),
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              await StorageRepository.putString(
                                  Keys.lang, selectedLang);
                              context
                                  .read<MediatationBloc>()
                                  .add(GetCategoriesEvent());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r)),
                                fixedSize: const Size(double.infinity, 48)),
                            child: Center(
                              child: Text(
                                savePref,
                                style: TextStyle(
                                    fontSize: AppSizes.size_20,
                                    color: context.isDark
                                        ? mainTextColor
                                        : Colors.white,
                                    fontWeight: AppFontWeight.w_600,
                                    fontFamily:
                                        AppfontFamily.abhaya.fontFamily),
                              ),
                            )),
                        SizedBox(height: he(24)),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(4.r)),
                                fixedSize: const Size(double.infinity, 48)),
                            child: Center(
                              child: Text(
                                startMediatations,
                                style: TextStyle(
                                    fontSize: AppSizes.size_20,
                                    color: context.isDark
                                        ? Colors.white
                                        : mainTextColor,
                                    fontWeight: AppFontWeight.w_600,
                                    fontFamily:
                                        AppfontFamily.abhaya.fontFamily),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
