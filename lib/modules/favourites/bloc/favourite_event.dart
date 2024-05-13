part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavouritesItem extends FavouriteEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FavouriteItemEvent extends FavouriteEvent {
  final int itemId;
  final bool isFavourite;
  const FavouriteItemEvent({required this.itemId, required this.isFavourite});
  @override
  // TODO: implement props
  List<Object> get props => [itemId, isFavourite];
}
