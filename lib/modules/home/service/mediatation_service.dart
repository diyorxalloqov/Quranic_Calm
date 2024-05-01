// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class MediatationService {
  MediatationDb mediatationDb;
  MediatationService({required this.mediatationDb});

  Future<Either<String, List<CategoryModel>>> getCategoryList() async {
    try {
      Response response = await Dio().get(AppUrls.categoryApi,
          queryParameters: {'lang': StorageRepository.getString(Keys.lang)});
      debugPrint("${response.statusCode} status code coming");

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        List<CategoryModel> data = (response.data['data'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        debugPrint('$data');
        for (CategoryModel element in data) {
          await mediatationDb.insertCategory(element);
        }
        return right(data);
      } else {
        return left(
            NetworkErrorResponse(response.statusMessage.toString()).error);
      }
    } on DioException catch (e) {
      return left(NetworkExeptionResponse(e).messageForUser);
    }
  }
}
