part of 'favourite_bloc.dart';

@immutable
class FavouriteState extends Equatable {
  final List<ItemsModel> favouriteItems;
  final ActionStatus favouriteStatus;

  const FavouriteState(
      {this.favouriteItems = const [],
      this.favouriteStatus = ActionStatus.isInitial});

  FavouriteState copyWith({
    ActionStatus? favouriteStatus,
    List<ItemsModel>? favouriteItems,
  }) {
    return FavouriteState(
        favouriteItems: favouriteItems ?? this.favouriteItems,
        favouriteStatus: favouriteStatus ?? this.favouriteStatus);
  }

  @override
  List<Object?> get props => [favouriteItems, favouriteStatus];
}
