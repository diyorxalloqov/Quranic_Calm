import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class SleepTimePage extends StatefulWidget {
  const SleepTimePage({super.key});

  @override
  State<SleepTimePage> createState() => _SleepTimePageState();
}

class _SleepTimePageState extends State<SleepTimePage> {
  bool isSleepTime = false;
  late TextEditingController _sleepTimeController;
  @override
  void initState() {
    _sleepTimeController = TextEditingController();
    super.initState();
  }

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
                              child: SvgPicture.asset(AppIcon.backButton,
                                  color: context.isDark ? Colors.white : null)),
                          Text(
                            sleepTime,
                            style: TextStyle(
                                fontSize: AppSizes.size_20,
                                fontWeight: AppFontWeight.w_600,
                                fontFamily: AppfontFamily.abhaya.fontFamily),
                          ),
                          SizedBox(width: he(40)),
                        ],
                      ),
                      SizedBox(height: he(50)),
                      Text(
                        setSleepTime,
                        style: const TextStyle(
                            fontFamily: AppfontFamily.inter,
                            fontSize: AppSizes.size_20,
                            fontWeight: AppFontWeight.w_400),
                      ),
                      SizedBox(height: he(21)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: TextField(
                              controller: _sleepTimeController,
                              textAlign: TextAlign.center,
                              maxLength: 10,
                              style: const TextStyle(
                                  fontFamily: AppfontFamily.inter,
                                  fontSize: AppSizes.size_20,
                                  fontWeight: AppFontWeight.w_400),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  counterText: '',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: context.isDark
                                              ? const Color(0xffE4E4EC)
                                              : Colors.black,
                                          width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                          color: context.isDark
                                              ? const Color(0xffE4E4EC)
                                              : Colors.black,
                                          width: 1)),
                                  constraints: BoxConstraints(
                                      maxHeight: he(Platform.isAndroid ||
                                              Platform.isAndroid
                                          ? 39
                                          : 50),
                                      maxWidth: wi(80)),
                                  contentPadding: EdgeInsets.zero),
                            ),
                          ),
                          SizedBox(width: wi(16)),
                          Text(
                            minutes,
                            style: const TextStyle(
                                fontFamily: AppfontFamily.inter,
                                fontSize: AppSizes.size_20,
                                fontWeight: AppFontWeight.w_400),
                          )
                        ],
                      ),
                      SizedBox(height: he(22)),
                      Center(
                        child: Text(
                          or,
                          style: const TextStyle(
                              fontFamily: AppfontFamily.inter,
                              fontSize: AppSizes.size_20,
                              fontWeight: AppFontWeight.w_400),
                        ),
                      ),
                      SizedBox(height: he(22)),
                      RadioListTile.adaptive(
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        value: true,
                        groupValue: isSleepTime,
                        fillColor: MaterialStatePropertyAll(
                            context.isDark ? Colors.white : Colors.black),
                        contentPadding: EdgeInsets.zero,
                        useCupertinoCheckmarkStyle: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Text(
                          shutDownSuraFinish,
                          style: const TextStyle(
                              fontFamily: AppfontFamily.inter,
                              fontSize: AppSizes.size_16,
                              fontWeight: AppFontWeight.w_400),
                        ),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              isSleepTime = newValue;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: context.bottom / 9 + 61, right: wi(32)),
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<MediatationBloc>().add(SetTimerEvent(
                                  timeCount: _sleepTimeController.text));
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                fixedSize: const Size(double.infinity, 48)),
                            child: Center(
                              child: Text(
                                savePref,
                                style: TextStyle(
                                    fontSize: AppSizes.size_20,
                                    color: Colors.white,
                                    fontWeight: AppFontWeight.w_600,
                                    fontFamily:
                                        AppfontFamily.abhaya.fontFamily),
                              ),
                            )),
                        SizedBox(height: he(24)),
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
