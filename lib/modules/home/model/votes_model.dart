class VotesModel {
  int? voteId;
  String? voteName;
  String? voteLang;
  String? voteAudioUrl;
  String? voteAudioName;
  String? voteCreateAt;
  String? voteIconUrl;
  String? voteIconName;

  VotesModel(
      {this.voteId,
      this.voteName,
      this.voteLang,
      this.voteAudioUrl,
      this.voteAudioName,
      this.voteCreateAt,
      this.voteIconUrl,
      this.voteIconName});

  VotesModel.fromJson(Map<String, dynamic> json) {
    voteId = int.tryParse(json['vote_id']);
    voteName = json['vote_name'];
    voteLang = json['vote_lang'];
    voteAudioUrl = json['vote_audio_url'];
    voteAudioName = json['vote_audio_name'];
    voteCreateAt = json['vote_create_at'];
    voteIconUrl = json['vote_icon_url'];
    voteIconName = json['vote_icon_name'];
  }

  VotesModel.fromJsonDb(Map<String, dynamic> json)
      : voteId = json['vote_id'],
        voteName = json['vote_name'],
        voteLang = json['vote_lang'],
        voteAudioUrl = json['vote_audio_url'],
        voteAudioName = json['vote_audio_name'],
        voteCreateAt = json['vote_create_at'],
        voteIconUrl = json['vote_icon_url'],
        voteIconName = json['vote_icon_name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vote_id'] = voteId;
    data['vote_name'] = voteName;
    data['vote_lang'] = voteLang;
    data['vote_audio_url'] = voteAudioUrl;
    data['vote_audio_name'] = voteAudioName;
    data['vote_create_at'] = voteCreateAt;
    data['vote_icon_url'] = voteIconUrl;
    data['vote_icon_name'] = voteIconName;
    return data;
  }
}
