import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class CardWidget extends StatelessWidget {
  final SuraData suraData;
  const CardWidget({super.key, required this.suraData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: ListTile(
        onTap: () => Navigator.of(context, rootNavigator: true)
            .pushNamed('suraDetailsPage'),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: context.isDark
                  ? numberContainerColorBlack
                  : numberContainerColor,
              borderRadius: BorderRadius.circular(12.r)),
          child: Text(
            suraData.leading,
            style: TextStyle(
                fontSize: AppSizes.size_20,
                color: context.isDark ? Colors.white : Colors.black,
                fontFamily: AppfontFamily.abhaya.fontFamily,
                fontWeight: AppFontWeight.w_600),
          ),
        ),
        trailing: Text(suraData.trailing,
            style: TextStyle(
                color: context.isDark ? Colors.white : Colors.black,
                fontFamily: AppfontFamily.inter,
                fontSize: AppSizes.size_16,
                fontWeight: AppFontWeight.w_400)),
        title: Text(suraData.title,
            style: TextStyle(
                color: context.isDark ? Colors.white : Colors.black,
                fontFamily: AppfontFamily.inter,
                fontSize: AppSizes.size_16,
                fontWeight: AppFontWeight.w_400)),
        subtitle: Text(suraData.subtitle,
            style: TextStyle(
                color: context.isDark ? Colors.white : Colors.black,
                fontFamily: AppfontFamily.inter,
                fontSize: AppSizes.size_14,
                fontWeight: AppFontWeight.w_400)),
      ),
    );
  }
}

class SuraData {
  final String leading;
  final String title;
  final String subtitle;
  final String trailing;
  final int index;
  SuraData(
      {required this.leading,
      required this.title,
      required this.index,
      required this.subtitle,
      required this.trailing});
}
