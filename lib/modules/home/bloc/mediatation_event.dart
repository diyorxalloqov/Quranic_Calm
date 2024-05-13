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

class MediatationVoiceStartEvent extends MediatationEvent {
  final String audioName;
  final String audioUrl;
  final int currentAudioId;
  MediatationVoiceStartEvent(
      {required this.audioName,
      required this.currentAudioId,
      required this.audioUrl});
  @override
  // TODO: implement props
  List<Object?> get props => [audioName, audioUrl, currentAudioId];
}

class GetSuggestionEvent extends MediatationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetVotesEvent extends MediatationEvent {
  final int page;
  GetVotesEvent({required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [page];
}

class ScheduleNotificationEvent extends MediatationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StartVoicesEvent extends MediatationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SetTimerEvent extends MediatationEvent {
  final String timeCount;
  SetTimerEvent({required this.timeCount});
  @override
  // TODO: implement props
  List<Object?> get props => [timeCount];
}
