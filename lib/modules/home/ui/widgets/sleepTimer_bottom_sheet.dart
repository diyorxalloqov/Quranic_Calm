import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/utils/extension/size.dart';

showSleepTimerBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isDismissible: true,
      context: context,
      backgroundColor: context.isDark ? Colors.black : Colors.white,
      builder: (context) => const SleepTimerBottomSheet());
}

class SleepTimerBottomSheet extends StatefulWidget {
  const SleepTimerBottomSheet({super.key});

  @override
  State<SleepTimerBottomSheet> createState() => _SleepTimePageState();
}

class _SleepTimePageState extends State<SleepTimerBottomSheet> {
  bool isSleepTime = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: wi(32)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: AppfontFamily.inter,
                          fontSize: AppSizes.size_20,
                          fontWeight: AppFontWeight.w_400),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1)),
                          constraints: BoxConstraints(
                              maxHeight: he(
                                  Platform.isAndroid || Platform.isAndroid
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
            padding:
                EdgeInsets.only(bottom: context.bottom / 9 + 60, right: wi(32)),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
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
                            color:
                                context.isDark ? mainTextColor : Colors.white,
                            fontWeight: AppFontWeight.w_600,
                            fontFamily: AppfontFamily.abhaya.fontFamily),
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
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(4.r)),
                        fixedSize: const Size(double.infinity, 48)),
                    child: Center(
                      child: Text(
                        startMediatations,
                        style: TextStyle(
                            fontSize: AppSizes.size_20,
                            color:
                                context.isDark ? Colors.white : mainTextColor,
                            fontWeight: AppFontWeight.w_600,
                            fontFamily: AppfontFamily.abhaya.fontFamily),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
