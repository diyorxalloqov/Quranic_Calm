import 'package:quranic_calm/core/constants/api/server.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';

class DioSettings {
  final BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: Server.server,
    connectTimeout: const Duration(seconds: 35),
    receiveTimeout: const Duration(seconds: 35),
    contentType: 'application/json',
    validateStatus: (status) =>
        status != null && status >= 100 && status <= 599,
    // headers: {
    //   'Content-Type': 'application/json',
    //   'Authorization': "Bearer ${await accessToken}"
    // },
  );

  BaseOptions get dioBaseOptions => _dioBaseOptions;
  Dio get dio {
    var dio1 = Dio(_dioBaseOptions)..interceptors.add(InterceptorsWrapper());
    return dio1;
  }
}
