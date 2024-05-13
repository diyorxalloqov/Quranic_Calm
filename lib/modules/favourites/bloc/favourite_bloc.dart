import 'dart:async';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:sqflite/sqflite.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(const FavouriteState()) {
    on<GetFavouritesItem>(_getFavorites);
    on<FavouriteItemEvent>(_addFavourite);
  }

  final MediatationDb _mediatationDb = MediatationDb();

  Future<FutureOr<void>> _getFavorites(
      GetFavouritesItem event, Emitter<FavouriteState> emit) async {
    emit(state.copyWith(favouriteStatus: ActionStatus.isLoading));
    try {
      List<ItemsModel> s = await _mediatationDb.getFavouritesItem();
      emit(state.copyWith(
          favouriteStatus: ActionStatus.isSuccess, favouriteItems: s));
    } on DatabaseException catch (e) {
      debugPrint(e.result.toString());
      emit(state.copyWith(favouriteStatus: ActionStatus.isError));
    }
  }

  Future<FutureOr<void>> _addFavourite(
      FavouriteItemEvent event, Emitter<FavouriteState> emit) async {
    await _mediatationDb.updateFavourite(event.itemId, event.isFavourite);
    emit(state.copyWith());
    add(GetFavouritesItem());
  }
}
