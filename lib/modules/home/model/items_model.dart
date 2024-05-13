class ItemsModel {
  int? itemId;
  String? itemName;
  int? categoryId;
  String? itemAudioUrl;
  String? itemAudioName;
  String? itemCreateAt;
  String? itemDescription;
  String? itemTime;
  bool isSaved;

  ItemsModel(
      {this.itemId,
      this.itemName,
      this.categoryId,
      this.itemAudioUrl,
      this.itemAudioName,
      this.itemCreateAt,
      this.itemDescription,
      this.isSaved = false,
      this.itemTime});

  ItemsModel.fromJson(Map<String, dynamic> json)
      : itemId = int.tryParse(json['item_id']),
        itemName = json['item_name'],
        categoryId = json['category_id'],
        itemAudioUrl = json['item_audio_url'],
        itemAudioName = json['item_audio_name'],
        itemCreateAt = json['item_create_at'],
        itemDescription = json['item_description'],
        itemTime = json['item_time'],
        isSaved = json['is_saved'] == 1;

  ItemsModel.fromJsonDb(Map<String, dynamic> json)
      : itemId = json['item_id'],
        itemName = json['item_name'],
        categoryId = json['category_id'],
        itemAudioUrl = json['item_audio_url'],
        itemAudioName = json['item_audio_name'],
        itemCreateAt = json['item_create_at'],
        itemDescription = json['item_description'],
        isSaved = json['is_saved'] == 1,
        itemTime = json['item_time'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['category_id'] = categoryId;
    data['item_audio_url'] = itemAudioUrl;
    data['item_audio_name'] = itemAudioName;
    data['item_create_at'] = itemCreateAt;
    data['item_description'] = itemDescription;
    data['item_time'] = itemTime;
    data['is_saved'] = isSaved ? 1 : 0;
    return data;
  }
}
