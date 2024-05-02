import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/home/model/items_model.dart';

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
    on<GetItemsEvent>(_getItems);
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
        add(GetItemsEvent(
            categoryId: state.categoryModel.first.categoryId ?? 0));
      } else {
        print('database does not contain data for the selected language');
        Either<String, List<CategoryModel>> datas =
            await _mediatationService.getCategoryList();
        datas.fold(
          (l) => emit(state.copyWith(status: ActionStatus.isError, error: l)),
          (r) {
            emit(state.copyWith(
                status: ActionStatus.isSuccess,
                categoryModel: r.reversed.toList()));
            add(GetItemsEvent(
                categoryId: state.categoryModel.first.categoryId ?? 0));
          },
        );
      }
    } else {
      print('database is empty');
      Either<String, List<CategoryModel>> datas =
          await _mediatationService.getCategoryList();
      datas.fold(
        (l) => emit(state.copyWith(status: ActionStatus.isError, error: l)),
        (r) {
          emit(state.copyWith(
              status: ActionStatus.isSuccess,
              categoryModel: r.reversed.toList()));
          add(GetItemsEvent(
              categoryId: state.categoryModel.first.categoryId ?? 0));
        },
      );
    }
  }

  Future<FutureOr<void>> _getItems(
      GetItemsEvent event, Emitter<MediatationState> emit) async {
    emit(state.copyWith(itemsStatus: ActionStatus.isLoading));
    List<ItemsModel>? data1 = await _mediatationDb.getItems(event.categoryId);
    print('EVENT ID ${event.categoryId}');
    if (data1 != null && data1.isNotEmpty) {
      List<ItemsModel> filteredData = data1
          .where((element) => element.categoryId == event.categoryId)
          .toList();

      if (filteredData.isNotEmpty) {
        // Check if the length of filtered data matches the expected length based on Juz numbers
        debugPrint("Data found in the database");
        print(data1.first.itemName);
        emit(state.copyWith(
            itemsStatus: ActionStatus.isSuccess, itemsModel: data1));
      } else {
        debugPrint(
            "Filtered data not found in the database or length doesn't match. Fetching from API...");
        print('database is empty');
        Either<String, List<ItemsModel>> datas =
            await _mediatationService.getCategoryItemsList(event.categoryId);
        datas.fold(
          (l) => emit(
              state.copyWith(itemsStatus: ActionStatus.isError, itemsError: l)),
          (r) => emit(state.copyWith(
              itemsStatus: ActionStatus.isSuccess, itemsModel: r)),
        );
      }
    } else {
      print('database is empty');
      Either<String, List<ItemsModel>> datas =
          await _mediatationService.getCategoryItemsList(event.categoryId);
      datas.fold(
        (l) => emit(
            state.copyWith(itemsStatus: ActionStatus.isError, itemsError: l)),
        (r) => emit(
            state.copyWith(itemsStatus: ActionStatus.isSuccess, itemsModel: r)),
      );
    }
  }
}
