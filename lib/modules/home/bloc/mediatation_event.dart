// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'mediatation_bloc.dart';

@immutable
abstract class MediatationEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCategoriesEvent extends MediatationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetItemsEvent extends MediatationEvent {
  final int categoryId;
  GetItemsEvent({required this.categoryId});

  @override
  // TODO: implement props
  List<Object?> get props => [categoryId];
}
