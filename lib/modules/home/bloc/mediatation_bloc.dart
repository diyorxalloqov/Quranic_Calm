import 'dart:async';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:dartz/dartz.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_cache/just_audio_cache.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/home/model/votes_model.dart';
import 'package:quranic_calm/modules/home/repository/mediatation_repository.dart';
import 'package:quranic_calm/modules/settings/service/notification/notification_scheduler.dart';

part 'mediatation_event.dart';
part 'mediatation_state.dart';

class MediatationBloc extends Bloc<MediatationEvent, MediatationState> {
  MediatationBloc() : super(const MediatationState()) {
    on<GetCategoriesEvent>(_getcategories);
    on<GetItemsEvent>(_getItems);
    on<MediatationVoiceStartEvent>(_downloadMedia);
    on<GetSuggestionEvent>(_getSuggestions);
    on<GetVotesEvent>(_getVotes);
    add(GetVotesEvent(page: 1));
    on<ScheduleNotificationEvent>(_scheduleNotification);
    on<StartVoicesEvent>(_startVoices);
    on<SetTimerEvent>(_setTimer);
  }

  AudioPlayer audioPlayer = AudioPlayer();
  List<AudioPlayer> audioPlayerBackNoise =
      List.generate(3, (index) => AudioPlayer());
  List<AudioSource> audioSources = [];
  List<AudioSource> audioSourcesInternet = [];
  int id = 0;

  final MediatationRepository _mediatationRepository = MediatationRepository();

  Future<void> _getcategories(
      GetCategoriesEvent event, Emitter<MediatationState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    Either<String, List<CategoryModel>> categories =
        await _mediatationRepository.getCategoryList();
    categories.fold(
        (l) => emit(state.copyWith(status: ActionStatus.isError, error: l)),
        (r) async {
      emit(state.copyWith(status: ActionStatus.isSuccess, categoryModel: r));
      add(GetItemsEvent(categoryId: state.categoryModel.first.categoryId ?? 0));
    });
  }

  Future<FutureOr<void>> _getItems(
      GetItemsEvent event, Emitter<MediatationState> emit) async {
    emit(state.copyWith(itemsStatus: ActionStatus.isLoading));
    Either<String, List<ItemsModel>> data1 =
        await _mediatationRepository.getCategoryItems(event.categoryId);
    debugPrint('EVENT ID ${event.categoryId}');
    data1.fold(
        (l) => emit(
            state.copyWith(itemsStatus: ActionStatus.isError, itemsError: l)),
        (r) {
      emit(state.copyWith(itemsStatus: ActionStatus.isSuccess, itemsModel: r));
      add(GetSuggestionEvent());
    });
  }

  Future<FutureOr<void>> _downloadMedia(
      MediatationVoiceStartEvent event, Emitter<MediatationState> emit) async {
    emit(state.copyWith(audioStatus: ActionStatus.isLoading));
    List<String> parts = event.audioName.split('-');
    String lastPart = parts.last;
    String nameWithoutExtension =
        lastPart.substring(0, lastPart.lastIndexOf('.'));
    debugPrint(nameWithoutExtension);

    final localFilePath =
        await _mediatationRepository.getLocalFilePath(event.audioName);
    final localFileExists = File(localFilePath).existsSync();
    if (localFileExists) {
      try {
        audioPlayer.setAudioSource(
          AudioSource.uri(
            Uri.file(localFilePath),
            tag: MediaItem(id: '${id++}', title: nameWithoutExtension),
          ),
        );
        emit(state.copyWith(
            audioStatus: ActionStatus.isSuccess,
            currentAudioId: event.currentAudioId));
        audioPlayer.play();
        add(StartVoicesEvent());
      } on PlayerException catch (e) {
        debugPrint('Player exeption ${e.message}');
        emit(state.copyWith(
            audioStatus: ActionStatus.isError, audioError: e.message));
      }
    } else {
      Either<String, StreamController<List<int>>> s =
          await _mediatationRepository.downloadAudio(
              event.audioName, event.audioUrl);
      s.fold(
          (l) => emit(
              state.copyWith(audioStatus: ActionStatus.isError, audioError: l)),
          (r) async {
        final localFilePath = await _mediatationRepository.saveAudioToLocal(
            r.stream, event.audioName);
        try {
          audioPlayer.setAudioSource(
            AudioSource.uri(
              Uri.file(localFilePath),
              tag: MediaItem(id: '${id++}', title: nameWithoutExtension),
            ),
          );
          audioPlayer.play();
          add(StartVoicesEvent());
          emit(state.copyWith(
              audioStatus: ActionStatus.isSuccess,
              currentAudioId: event.currentAudioId));
        } on PlayerException catch (e) {
          debugPrint('Player exeption ${e.message}');
          emit(state.copyWith(
              audioStatus: ActionStatus.isError, audioError: e.message));
        }
      });
    }
    // final directory = await getApplicationDocumentsDirectory();
    // String audioPath = '${directory.path}/audio_${event.path}.mp3';
    // final bool fileExists = await File(audioPath).exists();

    // if (!fileExists) {
    //   audioSourcesInternet.add(AudioSource.uri(Uri.parse(event.audioUrl),
    //       tag: MediaItem(id: '${id++}', title: event.path)));
    //   try {
    //     ConcatenatingAudioSource audioInternet =
    //         ConcatenatingAudioSource(children: audioSourcesInternet);
    //     await audioPlayer.setAudioSource(audioInternet);
    //     //  tag: MediaItem(id: '${id++}', title: 'ssss')
    //     await audioPlayer.play();
    //     emit(state.copyWith(audioStatus: ActionStatus.isSuccess));
    //     print('audio file not have db');
    //   } on PlayerException catch (e) {
    //     emit(state.copyWith(
    //         audioStatus: ActionStatus.isError, audioError: e.message));
    //     // debugPrint('audio yuklangan $audioPath');
    //   }
    //   Either<String, bool> data2 = await _mediatationRepository.downloadAudio(
    //       event.path, event.audioUrl);
    //   data2.fold((l) {
    //     print('ERROR SHOWING $l');
    //     emit(state.copyWith());
    //   }, (r) async {
    //     print('downloading');
    //     emit(state.copyWith(audioStatus: ActionStatus.isSuccess));
    //   });
    // } else {
    //   audioSources.add(AudioSource.file(audioPath,
    //       tag: MediaItem(id: '${id++}', title: event.path)));
    //   try {
    //     ConcatenatingAudioSource s =
    //         ConcatenatingAudioSource(children: audioSources);
    //     await audioPlayer.setAudioSource(s);
    //     await audioPlayer.play();
    //     emit(state.copyWith(audioStatus: ActionStatus.isSuccess));
    //     print('audio file has to db');
    //   } on PlayerException catch (e) {
    //     emit(state.copyWith(
    //         audioStatus: ActionStatus.isError, audioError: e.message));
    //   }
    //   return right(audioPath);
    // }
  }

  FutureOr<void> _getSuggestions(
      GetSuggestionEvent event, Emitter<MediatationState> emit) async {
    List<ItemsModel> data = state.itemsModel;
    List<CategoryModel> categoryData = state.categoryModel;
    List<ItemsModel> generateData = [];
    bool containsLang = categoryData
        .any((e) => e.categoryLang == StorageRepository.getString(Keys.lang));

    if (data.isNotEmpty && containsLang) {
      for (int i = 0; i < 10; i++) {
        int randomindex = Random().nextInt(data.length);
        generateData.add(data[randomindex]);
      }
      emit(state.copyWith(suggestionItems: generateData));
    }
  }

  Future<FutureOr<void>> _getVotes(
      GetVotesEvent event, Emitter<MediatationState> emit) async {
    emit(state.copyWith(votesStatus: ActionStatus.isLoading));
    Either<String, List<VotesModel>> data3 =
        await _mediatationRepository.getVotes(event.page);
    data3.fold(
        (l) => emit(
            state.copyWith(votesStatus: ActionStatus.isError, votesError: l)),
        (r) {
      emit(state.copyWith(votesStatus: ActionStatus.isSuccess, votesModel: r));
      audioPlayerBackNoise = List.generate(r.length, (index) => AudioPlayer());
    });
  }

  Future<FutureOr<void>> _startVoices(
      StartVoicesEvent event, Emitter<MediatationState> emit) async {
    emit(state.copyWith(voiceStatus: ActionStatus.isLoading));
    print('Votes downloading...');
    print('Votes length ${state.votesModel.length}');

    List.generate(state.votesModel.length, (index) async {
      double v = StorageRepository.getBoolList(Keys.backgroundNoises)[index]
          ? StorageRepository.getdoubleList(Keys.backgroundNoisesValue)[index]
          : 0.0;
      audioPlayerBackNoise[index].setVolume(v);
      audioPlayerBackNoise[index].setLoopMode(LoopMode.all);
      print("VOTES LENGTH ${state.votesModel.length}");
      VotesModel voteModel = state.votesModel[index];
      print("${state.votesModel[index].voteAudioUrl} $index index audio ");

      await audioPlayerBackNoise[index]
          .dynamicSet(url: voteModel.voteAudioUrl ?? '');
      await audioPlayerBackNoise[index].play();
    });
  }

  Future<FutureOr<void>> _scheduleNotification(
      ScheduleNotificationEvent event, Emitter<MediatationState> emit) async {
    // 2024-05-01 17:17:00.000
    DateTime time = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 00);
    print(time);
    ScheduledNotificationHelper().schedulePrayNotification(time);
  }

  @pragma('vm:entry-point')
  Future<FutureOr<void>> _setTimer(
      SetTimerEvent event, Emitter<MediatationState> emit) async {
    Timer.periodic(Duration(minutes: int.parse(event.timeCount)), (timer) {
      audioPlayer.dispose();
      List.generate(state.votesModel.length,
          (index) => audioPlayerBackNoise[index].dispose());
    });
    emit(state.copyWith(timerCount: event.timeCount));
    await StorageRepository.putString(Keys.sleepTimeCount, event.timeCount);
  }
}

late AudioHandler _audioHandler;

Future<void> main() async {
  _audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
        androidNotificationChannelName: 'Audio playback',
        androidNotificationOngoing: true),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Service Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<bool>(
              stream: _audioHandler.playbackState
                  .map((state) => state.playing)
                  .distinct(),
              builder: (context, snapshot) {
                final playing = snapshot.data ?? false;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button(Icons.skip_previous, _audioHandler.skipToPrevious),
                    if (playing)
                      _button(Icons.pause, _audioHandler.pause)
                    else
                      _button(Icons.play_arrow, _audioHandler.play),
                    _button(Icons.stop, _audioHandler.stop),
                    _button(Icons.skip_next, _audioHandler.skipToNext),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  IconButton _button(IconData iconData, VoidCallback onPressed) => IconButton(
        icon: Icon(iconData),
        iconSize: 64.0,
        onPressed: onPressed,
      );
}

class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  static final _item = MediaItem(
    id: 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
    album: "Science Friday",
    title: "A Salute To Head-Scratching Science",
    artist: "Science Friday and WNYC Studios",
    duration: const Duration(milliseconds: 5739820),
    artUri: Uri.parse(
        'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  );

  final _player = AudioPlayer();

  /// Initialise our audio handler.
  AudioPlayerHandler() {
    // So that our clients (the Flutter UI and the system notification) know
    // what state to display, here we set up our audio handler to broadcast all
    // playback state changes as they happen via playbackState...
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    // ... and also the current media item via mediaItem.
    mediaItem.add(_item);

    // Load the player.
    _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
  }

  // In this simple example, we handle only 4 actions: play, pause, seek and
  // stop. Any button press from the Flutter UI, notification, lock screen or
  // headset will be routed through to these 4 methods so that you can handle
  // your audio playback logic in one place.

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  /// Transform a just_audio event into an audio_service state.
  ///
  /// This method is used from the constructor. Every event received from the
  /// just_audio player will be transformed into an audio_service state so that
  /// it can be broadcast to audio_service clients.
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.skipToPrevious,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.skipToNext
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
