part of 'mediatation_bloc.dart';

@immutable
class MediatationState extends Equatable {
  final List<CategoryModel> categoryModel;
  final ActionStatus status;
  final String error;
  final ActionStatus itemsStatus;
  final List<ItemsModel> itemsModel;
  final String itemsError;
  final ActionStatus audioStatus;
  final String audioError;
  final List<ItemsModel> suggestionItems;
  final List<VotesModel> votesModel;
  final String votesError;
  final ActionStatus votesStatus;
  final ActionStatus voiceStatus;
  final int currentAudioId;
  final String timerCount;

  const MediatationState(
      {this.categoryModel = const [],
      this.itemsModel = const [],
      this.suggestionItems = const [],
      this.votesModel = const [],
      this.currentAudioId = -1,
      this.timerCount = '',
      this.voiceStatus = ActionStatus.isInitial,
      this.votesError = '',
      this.votesStatus = ActionStatus.isInitial,
      this.error = '',
      this.audioError = '',
      this.audioStatus = ActionStatus.isInitial,
      this.itemsStatus = ActionStatus.isInitial,
      this.itemsError = '',
      this.status = ActionStatus.isInitial});

  MediatationState copyWith(
      {List<CategoryModel>? categoryModel,
      ActionStatus? status,
      ActionStatus? audioStatus,
      int? currentAudioId,
      String? timerCount,
      String? audioError,
      List<ItemsModel>? itemsModel,
      ActionStatus? itemsStatus,
      List<ItemsModel>? suggestionItems,
      ActionStatus? votesStatus,
      ActionStatus? voiceStatus,
      String? votesError,
      List<VotesModel>? votesModel,
      String? itemsError,
      String? error}) {
    return MediatationState(
      itemsModel: itemsModel ?? this.itemsModel,
      categoryModel: categoryModel ?? this.categoryModel,
      error: error ?? this.error,
      votesStatus: votesStatus ?? this.votesStatus,
      votesError: votesError ?? this.votesError,
      voiceStatus: voiceStatus ?? this.voiceStatus,
      votesModel: votesModel ?? this.votesModel,
      currentAudioId: currentAudioId ?? this.currentAudioId,
      audioError: audioError ?? this.audioError,
      timerCount: timerCount ?? this.timerCount,
      audioStatus: audioStatus ?? this.audioStatus,
      itemsStatus: itemsStatus ?? this.itemsStatus,
      itemsError: itemsError ?? this.itemsError,
      suggestionItems: suggestionItems ?? this.suggestionItems,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        categoryModel,
        itemsError,
        audioStatus,
        itemsStatus,
        status,
        itemsModel,
        error,
        audioError,
        suggestionItems,
        votesModel,
        votesError,
        votesStatus,
        voiceStatus,
        currentAudioId,
        timerCount
      ];
}
