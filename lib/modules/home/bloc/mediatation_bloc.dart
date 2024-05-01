import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';

part 'mediatation_event.dart';
part 'mediatation_state.dart';

class MediatationBloc extends Bloc<MediatationEvent, MediatationState> {
  late final MediatationDb _mediatationDb;
  late final MediatationService _mediatationService;

  MediatationBloc() : super(const MediatationState()) {
    _mediatationDb = MediatationDb();
    _mediatationService = MediatationService(mediatationDb: _mediatationDb);
    on<GetCategoriesEvent>(_getcategories);
    add(GetCategoriesEvent());
  }

  Future<void> _getcategories(
      GetCategoriesEvent event, Emitter<MediatationState> emit) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    List<CategoryModel>? data = await _mediatationDb.getCategories();
    if (data != null && data.isNotEmpty) {
      bool containsLang = data.any((category) =>
          category.categoryLang == StorageRepository.getString(Keys.lang));
      if (containsLang) {
        print('database contains data for the selected language');
        print(data.first.categoryName);
        emit(state.copyWith(
            status: ActionStatus.isSuccess, categoryModel: data));
      } else {
        print('database does not contain data for the selected language');
        Either<String, List<CategoryModel>> datas =
            await _mediatationService.getCategoryList();
        datas.fold(
          (l) => emit(state.copyWith(status: ActionStatus.isError, error: l)),
          (r) => emit(
              state.copyWith(status: ActionStatus.isSuccess, categoryModel: r.reversed.toList())),
        );
      }
    } else {
      print('database is empty');
      Either<String, List<CategoryModel>> datas =
          await _mediatationService.getCategoryList();
      datas.fold(
        (l) => emit(state.copyWith(status: ActionStatus.isError, error: l)),
        (r) => emit(
            state.copyWith(status: ActionStatus.isSuccess, categoryModel: r.reversed.toList())),
      );
    }
  }
}
