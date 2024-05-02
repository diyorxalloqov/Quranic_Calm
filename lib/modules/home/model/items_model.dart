class ItemsModel {
  int? itemId;
  String? itemName;
  int? categoryId;
  String? itemAudioUrl;
  String? itemAudioName;
  String? itemCreateAt;
  String? itemDescription;
  String? itemTime;

  ItemsModel(
      {this.itemId,
      this.itemName,
      this.categoryId,
      this.itemAudioUrl,
      this.itemAudioName,
      this.itemCreateAt,
      this.itemDescription,
      this.itemTime});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = int.tryParse(json['item_id']);
    itemName = json['item_name'];
    categoryId = json['category_id'];
    itemAudioUrl = json['item_audio_url'];
    itemAudioName = json['item_audio_name'];
    itemCreateAt = json['item_create_at'];
    itemDescription = json['item_description'];
    itemTime = json['item_time'];
  }

  ItemsModel.fromJsonDb(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    categoryId = json['category_id'];
    itemAudioUrl = json['item_audio_url'];
    itemAudioName = json['item_audio_name'];
    itemCreateAt = json['item_create_at'];
    itemDescription = json['item_description'];
    itemTime = json['item_time'];
  }

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
    return data;
  }
}
