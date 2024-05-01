part of 'mediatation_bloc.dart';

@immutable
class MediatationState extends Equatable {
  final List<CategoryModel> categoryModel;
  final ActionStatus status;
  final String error;

  const MediatationState(
      {this.categoryModel = const [],
      this.error = '',
      this.status = ActionStatus.isInitial});

  MediatationState copyWith(
      {List<CategoryModel>? categoryModel,
      ActionStatus? status,
      String? error}) {
    return MediatationState(
      categoryModel: categoryModel ?? this.categoryModel,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [categoryModel, status, error];
}
