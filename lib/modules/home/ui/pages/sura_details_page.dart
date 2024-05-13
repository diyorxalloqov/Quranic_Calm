import 'package:just_audio/just_audio.dart';
import 'package:quranic_calm/modules/favourites/bloc/favourite_bloc.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/home/ui/widgets/sleepTimer_bottom_sheet.dart';
import 'package:quranic_calm/modules/settings/widgets/background_noise_widget.dart';

class SuraDetailsPage extends StatefulWidget {
  final int index;
  const SuraDetailsPage({super.key, required this.index});

  @override
  State<SuraDetailsPage> createState() => _SuraDetailsPageState();
}

class _SuraDetailsPageState extends State<SuraDetailsPage> {
  bool isSaved = false;
  late FavouriteBloc _favouriteBloc;
  int playerIndex = 0;

  @override
  void initState() {
    _favouriteBloc = FavouriteBloc();
    playerIndex = widget.index;
    super.initState();
  }

  @override
  void dispose() {
    _favouriteBloc.close();
    isSaved = false;
    super.dispose();
  }

  List<double> sliderValues = [0.1, 0.2, 0.3, 0.4];
  List<bool> enabledValues =
      StorageRepository.getBoolList(Keys.backgroundNoises);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _favouriteBloc,
      child: PopScope(
        onPopInvoked: (didPop) {},
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: BlocListener<MediatationBloc, MediatationState>(
            listener: (context, state) {
              if (state.audioStatus == ActionStatus.isError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.audioError)));
              }
            },
            child: BlocBuilder<MediatationBloc, MediatationState>(
              builder: (context, state) {
                isSaved = state.itemsModel[playerIndex].isSaved;
                sliderValues = List<double>.generate(
                    state.votesModel.length,
                    (index) => enabledValues[index]
                        ? StorageRepository.getdoubleList(
                            Keys.backgroundNoisesValue)[index]
                        : 0.0);
                return SingleChildScrollView(
                  child: Container(
                    height: context.height,
                    width: context.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: context.isDark
                                ? appBackgroundGradientBlack
                                : appBackgroundGradient),
                        image: DecorationImage(
                            image: AssetImage(context.isDark
                                ? AppImages.stars
                                : AppImages.clouds),
                            alignment: Alignment.bottomCenter)),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: SvgPicture.asset(AppIcon.backButton,
                                      color: context.isDark
                                          ? iconBlackColors
                                          : null)),
                              Text(
                                state.itemsModel[playerIndex].itemName ?? '',
                                style: TextStyle(
                                    fontSize: AppSizes.size_20,
                                    fontWeight: AppFontWeight.w_600,
                                    fontFamily:
                                        AppfontFamily.abhaya.fontFamily),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    isSaved = !isSaved;
                                    setState(() {});
                                    _favouriteBloc.add(FavouriteItemEvent(
                                        itemId: state.itemsModel[playerIndex]
                                                .itemId ??
                                            0,
                                        isFavourite: isSaved));
                                  },
                                  child: SvgPicture.asset(
                                      isSaved
                                          ? AppIcon.favouriteGreen
                                          : AppIcon.favourite,
                                      color: context.isDark
                                          ? isSaved
                                              ? primaryColorBlack
                                              : iconBlackColors
                                          : null)),
                            ],
                          ),
                          const Spacer(),
                          Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (playerIndex > 0) {
                                      playerIndex--;
                                      context.read<MediatationBloc>().add(
                                          MediatationVoiceStartEvent(
                                              currentAudioId: state
                                                      .itemsModel[playerIndex]
                                                      .itemId ??
                                                  0,
                                              audioName: state
                                                      .itemsModel[playerIndex]
                                                      .itemAudioName ??
                                                  '',
                                              audioUrl: state
                                                      .itemsModel[playerIndex]
                                                      .itemAudioUrl ??
                                                  ''));

                                      setState(() {});
                                    }
                                  },
                                  child: SvgPicture.asset(context.isDark
                                      ? AppIcon.previousBlack
                                      : AppIcon.previous),
                                ),
                                PlayerWidget(
                                    currentIndex: playerIndex, state: state),
                                GestureDetector(
                                  onTap: () {
                                    if (playerIndex < state.itemsModel.length) {
                                      playerIndex++;
                                    }
                                    context.read<MediatationBloc>().add(
                                        MediatationVoiceStartEvent(
                                            currentAudioId: state
                                                    .itemsModel[playerIndex]
                                                    .itemId ??
                                                0,
                                            audioName: state
                                                    .itemsModel[playerIndex]
                                                    .itemAudioName ??
                                                '',
                                            audioUrl: state
                                                    .itemsModel[playerIndex]
                                                    .itemAudioUrl ??
                                                ''));
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(context.isDark
                                      ? AppIcon.nextBlack
                                      : AppIcon.next),
                                ),
                              ],
                            ),
                            SizedBox(height: he(24)),
                            GestureDetector(
                              onTap: () => showSleepTimerBottomSheet(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: he(10), horizontal: wi(20)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: mainPurpleColor),
                                child: Text(
                                  '${state.timerCount.isEmpty ? StorageRepository.getString(Keys.sleepTimeCount).isEmpty ? 0 : StorageRepository.getString(Keys.sleepTimeCount) : state.timerCount} minute',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: AppfontFamily.inter,
                                      fontSize: AppSizes.size_20,
                                      fontWeight: AppFontWeight.w_400),
                                ),
                              ),
                            ),
                            SizedBox(height: he(30)),
                            IconButton(
                                onPressed: () => showModalBottomSheet(
                                    isDismissible: true,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(48),
                                            topRight: Radius.circular(48))),
                                    barrierColor: context.isDark
                                        ? Colors.transparent
                                        : null,
                                    context: context,
                                    builder: (context) => Container(
                                          height: state.votesStatus ==
                                                      ActionStatus.isLoading ||
                                                  state.votesStatus ==
                                                      ActionStatus.isError
                                              ? he(300)
                                              : null,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(48),
                                                  topRight:
                                                      Radius.circular(48))),
                                          width: double.infinity,
                                          child: BackgroundNoiseWidgetSlider(
                                              state: state,
                                              sliderValues: sliderValues),
                                        )),
                                icon: SvgPicture.asset(AppIcon.volume,
                                    color: context.isDark
                                        ? iconBlackColors
                                        : null)),
                            SizedBox(height: he(10)),
                            Text(setNoise,
                                style: const TextStyle(
                                    fontFamily: AppfontFamily.inter,
                                    fontWeight: AppFontWeight.w_700,
                                    fontSize: AppSizes.size_10))
                          ]),
                          SizedBox(height: context.bottom / 9 + 75)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerWidget extends StatefulWidget {
  final MediatationState state;
  final int currentIndex;
  const PlayerWidget(
      {super.key, required this.currentIndex, required this.state});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  void initState() {
    if (!context.read<MediatationBloc>().audioPlayer.playing ||
        widget.state.currentAudioId !=
            widget.state.itemsModel[widget.currentIndex].itemId) {
      context.read<MediatationBloc>().add(MediatationVoiceStartEvent(
          currentAudioId:
              widget.state.itemsModel[widget.currentIndex].itemId ?? 0,
          audioName:
              widget.state.itemsModel[widget.currentIndex].itemAudioName ?? '',
          audioUrl:
              widget.state.itemsModel[widget.currentIndex].itemAudioUrl ?? ''));
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: context.read<MediatationBloc>().audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.completed) {
          List.generate(widget.state.votesModel.length, (index) {
            context.read<MediatationBloc>().audioPlayerBackNoise[index].stop();
          });
        }
        if (processingState == ProcessingState.buffering ||
            processingState == ProcessingState.loading ||
            widget.state.audioStatus == ActionStatus.isLoading) {
          return Container(
            padding: const EdgeInsets.all(9.0),
            decoration: ShapeDecoration(
                color: context.isDark ? primaryColorBlack : mainPurpleColor,
                shape: const OvalBorder()),
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        } else if (playing != true) {
          return GestureDetector(
            onTap: () {
              context.read<MediatationBloc>().audioPlayer.play();
              List.generate(widget.state.votesModel.length, (index) {
                context
                    .read<MediatationBloc>()
                    .audioPlayerBackNoise[index]
                    .play();
              });
            },
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: ShapeDecoration(
                  color: context.isDark ? primaryColorBlack : mainPurpleColor,
                  shape: const OvalBorder()),
              child:
                  const Icon(Icons.play_arrow, size: 25, color: Colors.white),
            ),
          );
        } else if (processingState != ProcessingState.completed &&
            playing! &&
            widget.state.audioStatus != ActionStatus.isError) {
          return GestureDetector(
            onTap: () {
              context.read<MediatationBloc>().audioPlayer.pause();
              List.generate(widget.state.votesModel.length, (index) {
                context
                    .read<MediatationBloc>()
                    .audioPlayerBackNoise[index]
                    .pause();
              });
            },
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: ShapeDecoration(
                  color: context.isDark ? primaryColorBlack : mainPurpleColor,
                  shape: const OvalBorder()),
              child: SvgPicture.asset(AppIcon.pause),
            ),
          );
        } else if (widget.state.audioStatus == ActionStatus.isError) {
          return GestureDetector(
            onTap: () => context.read<MediatationBloc>().add(
                MediatationVoiceStartEvent(
                    currentAudioId:
                        widget.state.itemsModel[widget.currentIndex].itemId ??
                            0,
                    audioName: widget.state.itemsModel[widget.currentIndex]
                            .itemAudioName ??
                        '',
                    audioUrl: widget.state.itemsModel[widget.currentIndex]
                            .itemAudioUrl ??
                        '')),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: ShapeDecoration(
                  color: context.isDark ? primaryColorBlack : mainPurpleColor,
                  shape: const OvalBorder()),
              child: const Icon(Icons.error, size: 25, color: Colors.white),
            ),
          );
        } else {
          debugPrint('else ga kirdi');
          return GestureDetector(
            onTap: () => context.read<MediatationBloc>().add(
                MediatationVoiceStartEvent(
                    currentAudioId:
                        widget.state.itemsModel[widget.currentIndex].itemId ??
                            0,
                    audioName: widget.state.itemsModel[widget.currentIndex]
                            .itemAudioName ??
                        '',
                    audioUrl: widget.state.itemsModel[widget.currentIndex]
                            .itemAudioUrl ??
                        '')),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: ShapeDecoration(
                  color: context.isDark ? primaryColorBlack : mainPurpleColor,
                  shape: const OvalBorder()),
              child: const Icon(Icons.replay, size: 25, color: Colors.white),
            ),
          );
        }
      },
    );
  }
}
