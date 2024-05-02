import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class CategoryWidget extends StatefulWidget {
  final MediatationState state;
  const CategoryWidget({super.key, required this.state});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.state.categoryModel.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.length == 0
        ? _tabController = TabController(
            length: widget.state.categoryModel.length, vsync: this)
        : null;
    return widget.state.status == ActionStatus.isSuccess
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.black,
                  labelPadding: const EdgeInsets.only(left: 16),
                  dividerColor: Colors.transparent,
                  padding: const EdgeInsets.only(left: 12),
                  splashBorderRadius: BorderRadius.circular(24.r),
                  indicator: ShapeDecoration(
                    color: context.isDark ? primaryColorBlack : mainGreenColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: context.isDark
                                ? primaryColorBlack
                                : mainGreenColor,
                            width: 1),
                        borderRadius: BorderRadius.circular(24.r)),
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
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 1),
                  tabAlignment: TabAlignment.start,
                  tabs: List.generate(
                      widget.state.categoryModel.length,
                      (index1) => InkWell(
                            onTap: () {
                              _tabController.animateTo(index1,
                                  duration: Duration.zero,
                                  curve: Curves.easeIn);
                              context.read<MediatationBloc>().add(GetItemsEvent(
                                    categoryId: widget.state
                                            .categoryModel[index1].categoryId ??
                                        0,
                                  ));
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Tab(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.r),
                                  border: Border.all(
                                      color: context.isDark
                                          ? primaryColorBlack
                                          : mainGreenColor,
                                      width: 1.5),
                                ),
                                child: Text(
                                  widget
                                      .state.categoryModel[index1].categoryName
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: AppfontFamily.inter,
                                      fontWeight: AppFontWeight.w_400,
                                      fontSize: AppSizes.size_12,
                                      color: context.isDark
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ))),
              widget.state.itemsStatus == ActionStatus.isSuccess
                  ? ListView.builder(
                      itemCount: widget.state.itemsModel.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      itemBuilder: (context, index) {
                        return CardWidget(
                          suraData: SuraData(
                              leading: widget.state.itemsModel.length == 114
                                  ? numbers[index]
                                  : widget.state.itemsModel[index].itemName
                                          ?.substring(0, 1) ??
                                      '',
                              title:
                                  widget.state.itemsModel[index].itemName ?? '',
                              index: index,
                              subtitle: widget.state.itemsModel[index]
                                      .itemDescription ??
                                  '',
                              trailing:
                                  widget.state.itemsModel[index].itemTime ??
                                      ''),
                        );
                      })
                  : widget.state.itemsStatus == ActionStatus.isError
                      ? Center(
                          child: SizedBox(
                              height: he(Platform.isAndroid || Platform.isIOS
                                  ? 250
                                  : 400),
                              child: Text(widget.state.itemsError)),
                        )
                      : SizedBox(
                          height: he(
                              Platform.isAndroid || Platform.isIOS ? 250 : 400),
                          child: const Center(
                              child: CircularProgressIndicator.adaptive()),
                        ),
            ],
          )
        : widget.state.status == ActionStatus.isLoading
            ? SizedBox(
                height: he(Platform.isAndroid || Platform.isIOS ? 350 : 500),
                child:
                    const Center(child: CircularProgressIndicator.adaptive()),
              )
            : SizedBox(
                height: he(Platform.isAndroid || Platform.isIOS ? 350 : 500),
                child: Center(child: Text(widget.state.error)));
  }
}
