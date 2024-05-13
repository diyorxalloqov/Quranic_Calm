import 'package:quranic_calm/core/constants/keys.dart';
import 'package:quranic_calm/core/db/shared_preferences.dart';

String tableName = StorageRepository.getString(Keys.lang) == 'uzbek'
    ? 'CategoryModel'
    : 'CategoryModelEnglish';

String defaultIcon =
    '"https://server.qiblah.app/public/images/1714818566427-rain.svg';
