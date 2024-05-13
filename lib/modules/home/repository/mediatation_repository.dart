import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/home/model/votes_model.dart';

class MediatationRepository {
  final MediatationDb _mediatationDb = MediatationDb();
  final MediatationService _mediatationService = MediatationService();

  Future<Either<String, List<CategoryModel>>> getCategoryList() async {
    List<CategoryModel> s = await _mediatationDb.getCategories();
    bool containsLang =
        s.any((e) => e.categoryLang == StorageRepository.getString(Keys.lang));
    if (s.isNotEmpty && containsLang) {
      debugPrint('db is not empty');
      return right(s);
    } else {
      debugPrint('response working category');
      Either<String, List<CategoryModel>> category =
          await _mediatationService.getCategoryList();
      return category.fold((l) {
        return left(l);
      }, (r) async {
        for (CategoryModel element in r.reversed.toList()) {
          await _mediatationDb.insertCategory(element);
        }
        return right(r.reversed.toList());
      });
    }
  }

  Future<Either<String, List<ItemsModel>>> getCategoryItems(
      int categoryId) async {
    List<ItemsModel> itemsdb = await _mediatationDb.getItems(categoryId);
    List<ItemsModel> filteredData =
        itemsdb.where((element) => element.categoryId == categoryId).toList();

    if (itemsdb.isNotEmpty && filteredData.isNotEmpty) {
      debugPrint('getting database');
      return right(itemsdb);
    } else {
      debugPrint('response working item APIAPIAPIAP');
      Either<String, List<ItemsModel>> items =
          await _mediatationService.getCategoryItemsList(categoryId);
      return items.fold((l) => left(l), (r) async {
        for (ItemsModel element in r) {
          await _mediatationDb.insertItems(element);
        }
        return right(r);
      });
    }
  }

  Future<Either<String, StreamController<List<int>>>> downloadAudio(
      String path, String audioUrl) async {
    // Either<String, bool> audioDownload =
    //     await _mediatationService.downloadAudio(audioUrl, path);
    // return audioDownload.fold((l) => left(l), (r) => right(r));
    if (await hasInternet) {
      try {
        final Response response = await Dio().get(
          audioUrl,
          options: Options(responseType: ResponseType.stream),
        );
        print("${response.data} DATA");
        print(response.requestOptions.contentType);
        if (response.statusCode == 200) {
          final streamController = StreamController<List<int>>();

          response.data?.stream.listen(
            (List<int> data) {
              streamController.add(data);
            },
            onDone: () {
              streamController.close();
            },
            onError: (error) {
              streamController.close();
              throw Exception('Failed to load audio stream: $error');
            },
          );
          return right(streamController);
        } else {
          return left(NetworkErrorResponse('Failed to load audio').error);
        }
      } on DioException catch (e) {
        return left(NetworkExeptionResponse(e).messageForUser);
      }
    } else {
      // Handle the case where neither local file exists nor there's internet connectivity
      return left('No internet connectivity and local file does not exist.');
    }
  }

  Future<String> getLocalFilePath(String audioName) async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String appDirPath = appDir.path;
    return '$appDirPath/audio_$audioName';
  }

  Future<String> saveAudioToLocal(
      Stream<List<int>> audioStream, String audioName) async {
    final localFilePath = await getLocalFilePath(audioName);
    final file = File(localFilePath);
    final IOSink sink = file.openWrite();
    await for (final bytes in audioStream) {
      sink.add(bytes);
    }
    await sink.close();
    return localFilePath;
  }

  Future<Either<String, String>> downloadBackgroundNoise(
      String audioPath, String audioUrl) async {
    Either<String, bool> audioDownload =
        await _mediatationService.downloadAudio(audioUrl, audioPath);
    return audioDownload.fold(
        (l) => left('Voice ERROR $l'), (r) => right("$audioPath AUDIO PATH"));
  }

  Future<Either<String, List<VotesModel>>> getVotes(int page) async {
    List<VotesModel> votesDb = await _mediatationDb.getVotes();
    bool containsLang = votesDb
        .any((e) => e.voteLang == StorageRepository.getString(Keys.lang));

    if (votesDb.isNotEmpty && containsLang) {
      debugPrint('getting database votes');
      print(votesDb.first.voteAudioUrl);
      return right(votesDb);
    } else {
      debugPrint('response working Votes APIAPIAPIAPI');
      Either<String, List<VotesModel>> items =
          await _mediatationService.getVotes(page);
      return items.fold((l) => left(l), (r) async {
        for (VotesModel element in r) {
          await _mediatationDb.insertVotes(element);
        }
        return right(r);
      });
    }
  }
}
