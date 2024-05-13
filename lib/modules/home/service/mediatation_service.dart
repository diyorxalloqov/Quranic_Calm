// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/home/model/votes_model.dart';

class MediatationService {
  final Dio client = Dio();

  Future<Either<String, List<CategoryModel>>> getCategoryList() async {
    try {
      final Response response = await client.get(AppUrls.categoryApi,
          queryParameters: {'lang': StorageRepository.getString(Keys.lang)});
      debugPrint("${response.statusCode} status code coming category");

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        List<CategoryModel> data = (response.data['data'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return right(data);
      } else if (response.statusCode == 404) {
        print('getting status code coming 404');
        return left(NetworkErrorResponse('Malumotlar mavjud emas').error);
      } else {
        return left(
            NetworkErrorResponse(response.statusMessage.toString()).error);
      }
    } on DioException catch (e) {
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }

  Future<Either<String, List<ItemsModel>>> getCategoryItemsList(
      int categoryId) async {
    try {
      final Response response = await client.get(AppUrls.categoryItems,
          queryParameters: {'category_id': categoryId});
      debugPrint("${response.statusCode} status code coming");
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        List<ItemsModel> data = (response.data['data'] as List)
            .map((e) => ItemsModel.fromJson(e))
            .toList();
        return right(data);
      } else if (response.statusCode == 404) {
        print('getting status code coming 404');
        return left(NetworkErrorResponse('Malumotlar mavjud emas').error);
      } else {
        return left(
            NetworkErrorResponse(response.statusMessage.toString()).error);
      }
    } on DioException catch (e) {
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }

  Future<Either<String, bool>> downloadAudio(
      String url, String savePath) async {
    debugPrint(url);
    debugPrint(savePath);
    try {
      final Response response = await client.download(url, savePath,
          onReceiveProgress: (count, total) {
        if (total <= 0) return;
        print('Voice percentage: ${(count / total * 100).toStringAsFixed(0)}%');
      });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return right(true);
      } else {
        return left(
            NetworkErrorResponse(response.statusMessage.toString()).error);
      }
    } on DioException catch (e) {
      debugPrint('Error downloading audio: $e');
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }

  Future<Either<String, List<VotesModel>>> getVotes(int page) async {
    try {
      Response response = await client.get(AppUrls.getVotes, queryParameters: {
        'limit': 10,
        'page': page,
        'lang': StorageRepository.getString(Keys.lang)
      });
      print("${response.realUri}REAL URL");
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        List<VotesModel> data = (response.data['data'] as List)
            .map((e) => VotesModel.fromJson(e))
            .toList();

        return right(data);
      } else if (response.statusCode == 404) {
        print('getting status code coming 404');
        return left(NetworkErrorResponse('Malumotlar mavjud emas').error);
      } else {
        return left(
            NetworkErrorResponse(response.statusMessage.toString()).error);
      }
    } on DioException catch (e) {
      print(e.response?.realUri);
      print('votes exeption');
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }
}
