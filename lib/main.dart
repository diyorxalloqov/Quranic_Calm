import 'package:quranic_calm/modules/app.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';

void main(List<String> args) async {
  // await JustAudioBackground.init(
  //     androidNotificationChannelId: 'com.app.bg_demo.channel.audio',
  //     androidNotificationChannelName: 'Audio playback');
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  if (StorageRepository.getString(Keys.lang) == '') {
    print('storage empty');
    await StorageRepository.putString(Keys.lang, 'english');
  }
  runApp(EasyLocalization(
      saveLocale: true,
      startLocale: const Locale('en'),
      supportedLocales: const [Locale("uz"), Locale("en")],
      path: "lib/core/lang",
      child: const App()));

  // portraitUp (vertikal) rejimida bo'lishi uchun
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // StatusBar Temasi
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
}


// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
// await JustAudioBackground.init(
//     androidNotificationChannelId: 'com.app.bg_demo.channel.audio',
//     androidNotificationChannelName: 'Audio playback',
//     androidNotificationOngoing: true,
//     notificationColor: Colors.green);
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late final AudioPlayer _player;
//   // final url =
//   //     'https://server.qiblah.app/public/images/1714751217904-114SurahAn-Nas.mp3';
//   final sources = [
//     'https://server.qiblah.app/public/images/1714740774233-001SurahAl-Fatiha.mp3',
//     'https://server.qiblah.app/public/images/1714741974876-002SurahAl-Baqarah.mp3'
//         "https://server.qiblah.app/public/images/1714751187643-112SurahAl-Ikhlas.mp3",
//     "https://server.qiblah.app/public/images/1714751204859-113SurahAl-Falaq.mp3",
//     'https://server.qiblah.app/public/images/1714751217904-114SurahAn-Nas.mp3'
//   ];
//   int currentIndex = 0;
//   int id = 0;

//   @override
//   void initState() {
//     _player = AudioPlayer();
//     _player.setAudioSource(ConcatenatingAudioSource(
//         children: List.generate(
//             sources.length,
//             (index) => AudioSource.uri(Uri.parse(sources[index]),
//                 tag: MediaItem(id: '${id++}', title: 'ssss')))));

//     _player.play();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Container(
//         color: Colors.white,
//         child: Center(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder<SequenceState?>(
//               stream: _player.sequenceStateStream,
//               builder: (context, snapshot) => IconButton(
//                 onPressed: () {
//                   currentIndex--;
//                   // _player.dynamicSet(url: sources[currentIndex]);
//                   _player.hasPrevious ? _player.seekToPrevious() : null;
//                 },
//                 icon: const Icon(Icons.skip_previous),
//               ),
//             ),
//             StreamBuilder(
//               stream: _player.playerStateStream,
//               builder: (context, snapshot) {
//                 final playerState = snapshot.data;
//                 final processingState = playerState?.processingState;
//                 final playing = playerState?.playing;
//                 debugPrint('Processing State:$processingState ');
//                 debugPrint('Is Playing: $playing');
//                 if (processingState == ProcessingState.loading ||
//                     processingState == ProcessingState.buffering) {
//                   return Container(
//                     padding: const EdgeInsets.all(9.0),
//                     decoration: const ShapeDecoration(shape: OvalBorder()),
//                     child: const CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                     ),
//                   );
//                 } else if (playing != true) {
//                   debugPrint('salommmmmm $processingState');
//                   return GestureDetector(
//                     onTap: () {
//                       /// for blan index generete qilib berish har biriga
//                       _player.play();
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(15.0),
//                       decoration: ShapeDecoration(shape: const OvalBorder()),
//                       child: const Icon(Icons.play_arrow, size: 25),
//                     ),
//                   );
//                 } else if (processingState != ProcessingState.completed &&
//                     playing!) {
//                   return GestureDetector(
//                     onTap: () {
//                       _player.pause();
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(15.0),
//                       decoration: const ShapeDecoration(shape: OvalBorder()),
//                       child: Icon(Icons.pause),
//                     ),
//                   );
//                 } else {
//                   return GestureDetector(
//                     onTap: () {
//                       _player.seek(Duration.zero);
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(15.0),
//                       decoration: ShapeDecoration(shape: const OvalBorder()),
//                       child: const Icon(Icons.replay),
//                     ),
//                   );
//                 }
//               },
//             ),
// StreamBuilder<SequenceState?>(
//   stream: _player.sequenceStateStream,
//   builder: (context, snapshot) => IconButton(
//     onPressed: () {
//       currentIndex++;
//       // _player.dynamicSet(url: sources[currentIndex]);
//       _player.hasNext ? _player.seekToNext() : null;
//     },
//     icon: const Icon(Icons.skip_next),
//   ),
// ),
//           ],
//         )),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:dio/dio.dart';

// void main() {
//   runApp(MaterialApp(home: AudioPlayerPage()));
// }

// class AudioPlayerPage extends StatefulWidget {
//   @override
//   _AudioPlayerPageState createState() => _AudioPlayerPageState();
// }

// class _AudioPlayerPageState extends State<AudioPlayerPage> {
//   late final AudioPlayer _player;
//   final sources = [
//     'https://server.qiblah.app/public/images/1714740774233-001SurahAl-Fatiha.mp3',
//     'https://server.qiblah.app/public/images/1714741974876-002SurahAl-Baqarah.mp3',
//     'https://server.qiblah.app/public/images/1714751187643-112SurahAl-Ikhlas.mp3',
//     'https://server.qiblah.app/public/images/1714751204859-113SurahAl-Falaq.mp3',
//     'https://server.qiblah.app/public/images/1714751217904-114SurahAn-Nas.mp3'
//   ];
//   late String _localFilePath;
//   int currentIndex = 0;
//   int id = 0;

//   @override
//   void initState() {
//     super.initState();
//     _player = AudioPlayer();
//     _initPlayer();
//   }

//   Future<void> _initPlayer() async {
//     final audioUrl = sources[currentIndex];
//     final response = await Dio().get(
//       audioUrl,
//       options: Options(responseType: ResponseType.stream),
//     );
//     if (response.statusCode == 200) {
//       final streamController = StreamController<List<int>>();
//       response.data.stream.listen(
//         (List<int> data) {
//           streamController.add(data);
//         },
//         onDone: () {
//           streamController.close();
//         },
//         onError: (error) {
//           streamController.close();
//           throw Exception('Failed to load audio stream: $error');
//         },
//       );
//       _localFilePath = await _saveAudioToLocal(streamController.stream);
//       _player.setAudioSource(
//         AudioSource.uri(
//           Uri.file(_localFilePath),
//           tag: MediaItem(id: '${id++}', title: 'ssss'),
//         ),
//       );
//       _player.play();
//     } else {
//       throw Exception('Failed to load audio');
//     }
//   }

//   Future<String> _saveAudioToLocal(Stream<List<int>> audioStream) async {
//     final Directory appDir = await getApplicationDocumentsDirectory();
//     final String appDirPath = appDir.path;
//     final String fileName = 'audio_${currentIndex + 1}.mp3';
//     final String filePath = '$appDirPath/$fileName';

//     // Open a file for writing
//     final file = File(filePath);
//     final IOSink sink = file.openWrite();

//     // Write each chunk of bytes from the stream to the file
//     await for (final bytes in audioStream) {
//       sink.add(bytes);
//     }

//     // Close the file
//     await sink.close();

//     return filePath;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio Player'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder<Duration?>(
//               stream: _player.durationStream,
//               builder: (context, snapshot) {
//                 final duration = snapshot.data ?? Duration.zero;
//                 return Text('${duration.inSeconds} seconds');
//               },
//             ),
//             SizedBox(height: 20),
//             StreamBuilder<SequenceState?>(
//               stream: _player.sequenceStateStream,
//               builder: (context, snapshot) {
//                 final state = snapshot.data;
//                 if (state == null || state.sequence.isEmpty) return SizedBox();
//                 final currentIndex = state.currentIndex;
//                 final currentTrack = state.sequence[currentIndex];
//                 return Text(currentTrack.tag.title ?? '');
//               },
//             ),
//             SizedBox(height: 20),
//             PlaybackButton(_player),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }
// }

// class PlaybackButton extends StatelessWidget {
//   final AudioPlayer audioPlayer;

//   PlaybackButton(this.audioPlayer);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<PlayerState>(
//       stream: audioPlayer.playerStateStream,
//       builder: (context, snapshot) {
//         final playerState = snapshot.data;
//         final processingState = playerState?.processingState;
//         final playing = playerState?.playing;
//         if (processingState == ProcessingState.loading ||
//             processingState == ProcessingState.buffering) {
//           return CircularProgressIndicator();
//         } else if (playing != true) {
//           return ElevatedButton(
//             onPressed: audioPlayer.play,
//             child: Text('Play'),
//           );
//         } else if (processingState != ProcessingState.completed) {
//           return ElevatedButton(
//             onPressed: audioPlayer.pause,
//             child: Text('Pause'),
//           );
//         } else {
//           return ElevatedButton(
//             onPressed: () => audioPlayer.seek(Duration.zero),
//             child: Text('Replay'),
//           );
//         }
//       },
//     );
//   }
// }









/*  */



/* 


 */


/*  */






// import 'dart:async';
// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';
// import 'package:quranic_calm/modules/global/imports/app_imports.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(home: AudioPlayerPage()));
// }

// class AudioPlayerPage extends StatefulWidget {
//   @override
//   _AudioPlayerPageState createState() => _AudioPlayerPageState();
// }

// class _AudioPlayerPageState extends State<AudioPlayerPage> {
//   late final AudioPlayer _player;
//   final sources = [
//     'https://server.qiblah.app/public/images/1714740774233-001SurahAl-Fatiha.mp3',
//     'https://server.qiblah.app/public/images/1714741974876-002SurahAl-Baqarah.mp3',
//     'https://server.qiblah.app/public/images/1714751187643-112SurahAl-Ikhlas.mp3',
//     'https://server.qiblah.app/public/images/1714751204859-113SurahAl-Falaq.mp3',
//     'https://server.qiblah.app/public/images/1714751217904-114SurahAn-Nas.mp3'
//   ];
//   int currentIndex = 0;
//   int id = 0;

//   @override
//   void initState() {
//     super.initState();
//     _player = AudioPlayer();
//     _initPlayer();
//   }

//   Future<void> _initPlayer() async {
//     final localFilePath = await _getLocalFilePath();
//     final localFileExists = File(localFilePath).existsSync();
//     if (localFileExists) {
//       _player.setAudioSource(
//         AudioSource.uri(
//           Uri.file(localFilePath),
//           tag: MediaItem(id: '${id++}', title: 'ssss'),
//         ),
//       );
//       _player.play();
//     } else {
//       if (await hasInternet) {
//         final audioUrl = sources[currentIndex];
//         final response = await Dio().get(
//           audioUrl,
//           options: Options(responseType: ResponseType.stream),
//         );
//         if (response.statusCode == 200) {
//           final streamController = StreamController<List<int>>();
//           response.data.stream.listen(
//             (List<int> data) {
//               streamController.add(data);
//             },
//             onDone: () {
//               streamController.close();
//             },
//             onError: (error) {
//               streamController.close();
//               throw Exception('Failed to load audio stream: $error');
//             },
//           );
//           final localFilePath =
//               await _saveAudioToLocal(streamController.stream,'');
//           _player.setAudioSource(
//             AudioSource.uri(
//               Uri.file(localFilePath),
//               tag: MediaItem(id: '${id++}', title: 'ssss'),
//             ),
//           );
//           _player.play();
//         } else {
//           throw Exception('Failed to load audio');
//         }
//       } else {
//         // Handle the case where neither local file exists nor there's internet connectivity
//         print('No internet connectivity and local file does not exist.');
//       }
//     }
//   }

//   Future<String> _getLocalFilePath(String audioName) async {
//     final Directory appDir = await getApplicationDocumentsDirectory();
//     final String appDirPath = appDir.path;
//     return '$appDirPath/audio_$audioName.mp3';
//   }

//   Future<String> _saveAudioToLocal(
//       Stream<List<int>> audioStream, String audioName) async {
//     final localFilePath = await _getLocalFilePath(audioName);
//     final file = File(localFilePath);
//     final IOSink sink = file.openWrite();
//     await for (final bytes in audioStream) {
//       sink.add(bytes);
//     }
//     await sink.close();
//     return localFilePath;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // StreamBuilder<Duration?>(
//             //   stream: _player.durationStream,
//             //   builder: (context, snapshot) {
//             //     final duration = snapshot.data ?? Duration.zero;
//             //     return Text('${duration.inSeconds} seconds');
//             //   },
//             // ),
//             // SizedBox(height: 20),
//             // StreamBuilder<SequenceState?>(
//             //   stream: _player.sequenceStateStream,
//             //   builder: (context, snapshot) {
//             //     final state = snapshot.data;
//             //     if (state == null || state.sequence.isEmpty) return SizedBox();
//             //     final currentIndex = state.currentIndex;
//             //     final currentTrack = state.sequence[currentIndex];
//             //     return Text(currentTrack.tag.title ?? '');
//             //   },
//             // ),
//             // SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 StreamBuilder<SequenceState?>(
//                   stream: _player.sequenceStateStream,
//                   builder: (context, snapshot) => IconButton(
//                     onPressed: () {
//                       if (currentIndex != 0) {
//                         currentIndex--;
//                       }
//                       // _player.dynamicSet(url: sources[currentIndex]);
//                       _player.hasNext ? _player.seekToPrevious() : null;
//                       _initPlayer();
//                     },
//                     icon: const Icon(Icons.skip_previous),
//                   ),
//                 ),
//                 PlaybackButton(_player),
//                 StreamBuilder<SequenceState?>(
//                   stream: _player.sequenceStateStream,
//                   builder: (context, snapshot) => IconButton(
//                     onPressed: () {
//                       if (currentIndex < sources.length) {
//                         currentIndex++;
//                       }
//                       // _player.dynamicSet(url: sources[currentIndex]);
//                       _player.hasNext ? _player.seekToNext() : null;
//                       _initPlayer();
//                     },
//                     icon: const Icon(Icons.skip_next),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }
// }

// class PlaybackButton extends StatelessWidget {
//   final AudioPlayer audioPlayer;

//   const PlaybackButton(this.audioPlayer, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<PlayerState>(
//       stream: audioPlayer.playerStateStream,
//       builder: (context, snapshot) {
//         final playerState = snapshot.data;
//         final processingState = playerState?.processingState;
//         final playing = playerState?.playing;
//         if (processingState == ProcessingState.loading ||
//             processingState == ProcessingState.buffering) {
//           return CircularProgressIndicator(color: Colors.green);
//         } else if (playing != true) {
//           return ElevatedButton(
//             onPressed: audioPlayer.play,
//             child: Text('Play'),
//           );
//         } else if (processingState != ProcessingState.completed) {
//           return ElevatedButton(
//             onPressed: audioPlayer.pause,
//             child: Text('Pause'),
//           );
//         } else {
//           return ElevatedButton(
//             onPressed: () => audioPlayer.seek(Duration.zero),
//             child: Text('Replay'),
//           );
//         }
//       },
//     );
//   }
// }
