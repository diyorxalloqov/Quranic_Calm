import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/utils/parser/time_parser.dart';

class CardWidget extends StatelessWidget {
  final MediatationState state;
  final int index;

  const CardWidget({super.key, required this.index, required this.state});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediatationBloc, MediatationState>(
      builder: (context, state) {
        return Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: ListTile(
            onTap: () async {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed('suraDetailsPage', arguments: index);
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: context.isDark
                      ? numberContainerColorBlack
                      : numberContainerColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                state.itemsModel.length == 114
                    ? numbers[index]
                    : state.itemsModel[index].itemName?.substring(0, 1) ?? '',
                style: TextStyle(
                    fontSize: AppSizes.size_20,
                    color: context.isDark ? Colors.white : Colors.black,
                    fontFamily: AppfontFamily.abhaya.fontFamily,
                    fontWeight: AppFontWeight.w_600),
              ),
            ),
            trailing: Text(
                state.itemsModel.length == 114
                    ? timeParse(state.itemsModel[index].itemTime ?? '')
                    : state.itemsModel[index].itemTime ?? '',
                style: TextStyle(
                    color: context.isDark ? Colors.white : Colors.black,
                    fontFamily: AppfontFamily.inter,
                    fontSize: AppSizes.size_16,
                    fontWeight: AppFontWeight.w_400)),
            title: Text(state.itemsModel[index].itemName ?? '',
                style: TextStyle(
                    color: context.isDark ? Colors.white : Colors.black,
                    fontFamily: AppfontFamily.inter,
                    fontSize: AppSizes.size_16,
                    fontWeight: AppFontWeight.w_400)),
            subtitle: Text(state.itemsModel[index].itemDescription ?? '',
                style: TextStyle(
                    color: context.isDark ? Colors.white : Colors.black,
                    fontFamily: AppfontFamily.inter,
                    fontSize: AppSizes.size_14,
                    fontWeight: AppFontWeight.w_400)),
          ),
        );
      },
    );
  }
}
