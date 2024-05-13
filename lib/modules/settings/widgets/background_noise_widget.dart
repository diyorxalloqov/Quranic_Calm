import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class BackgroundNoiseWidgetSlider extends StatefulWidget {
  final MediatationState state;
  final List<double> sliderValues;
  const BackgroundNoiseWidgetSlider(
      {super.key, required this.sliderValues, required this.state});

  @override
  State<BackgroundNoiseWidgetSlider> createState() =>
      _BackgroundNoiseWidgetSliderState();
}

class _BackgroundNoiseWidgetSliderState
    extends State<BackgroundNoiseWidgetSlider> {
  @override
  Widget build(BuildContext context) {
    if (widget.state.votesStatus == ActionStatus.isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (widget.state.votesStatus == ActionStatus.isSuccess) {
      return Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: context.height / 2),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: context.isDark ? voiceContainerColor : Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
                widget.state.votesModel.length,
                (index) => Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: context.isDark
                                      ? backgroundNoiseBlackColor
                                      : mainGreenColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: CachedNetworkImage(
                                  imageUrl: widget.state.votesModel[index]
                                          .voteIconUrl ??
                                      defaultIcon),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: wi(25)),
                                    Text(
                                      widget.state.votesModel[index].voteName ??
                                          '',
                                      style: TextStyle(
                                          color: context.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontFamily: AppfontFamily.inter,
                                          fontSize: AppSizes.size_14,
                                          fontWeight: AppFontWeight.w_400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: he(20),
                                  child: Slider.adaptive(
                                      value: widget.sliderValues[index],
                                      inactiveColor: mainBlueColor,
                                      activeColor: context.isDark
                                          ? backgroundNoiseBlackColor
                                          : mainGreenColor,
                                      thumbColor: context.isDark
                                          ? backgroundNoiseBlackColor
                                          : mainGreenColor,
                                      onChanged: (v) {
                                        setState(() {
                                          widget.sliderValues[index] = v;
                                        });
                                        context
                                            .read<MediatationBloc>()
                                            .audioPlayerBackNoise[index]
                                            .setVolume(
                                                widget.sliderValues[index]);
                                      }),
                                )
                              ],
                            )
                          ],
                        ),
                        index == widget.state.votesModel.length - 1
                            ? const SizedBox.shrink()
                            : SizedBox(height: he(16))
                      ],
                    )),
          ),
        ),
      );
    } else if (widget.state.votesStatus == ActionStatus.isError) {
      return Center(child: Text(widget.state.votesError));
    }
    return const SizedBox.shrink();
  }
}
