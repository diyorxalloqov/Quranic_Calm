part of 'mediatation_bloc.dart';

@immutable
class MediatationState extends Equatable {
  final List<CategoryModel> categoryModel;
  final ActionStatus status;
  final String error;
  final ActionStatus itemsStatus;
  final List<ItemsModel> itemsModel;
  final String itemsError;

  const MediatationState(
      {this.categoryModel = const [],
      this.itemsModel = const [],
      this.error = '',
      this.itemsStatus = ActionStatus.isInitial,
      this.itemsError = '',
      this.status = ActionStatus.isInitial});

  MediatationState copyWith(
      {List<CategoryModel>? categoryModel,
      ActionStatus? status,
      List<ItemsModel>? itemsModel,
      ActionStatus? itemsStatus,
      String? itemsError,
      String? error}) {
    return MediatationState(
      itemsModel: itemsModel ?? this.itemsModel,
      categoryModel: categoryModel ?? this.categoryModel,
      error: error ?? this.error,
      itemsStatus: itemsStatus ?? this.itemsStatus,
      itemsError: itemsError ?? this.itemsError,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [categoryModel, itemsError, itemsStatus, status, itemsModel, error];
}
