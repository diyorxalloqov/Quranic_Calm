class CategoryModel {
  int? categoryId; // Change categoryId type to int
  String? categoryName;
  String? categoryLang;
  String? categoryCreateAt;

  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categoryLang,
    this.categoryCreateAt,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = int.tryParse(json['category_id'] ?? '');
    categoryName = json['category_name'];
    categoryLang = json['category_lang'];
    categoryCreateAt = json['category_create_at'];
  }
  CategoryModel.fromJsonDb(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryLang = json['category_lang'];
    categoryCreateAt = json['category_create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_lang'] = categoryLang;
    data['category_create_at'] = categoryCreateAt;
    return data;
  }
}
