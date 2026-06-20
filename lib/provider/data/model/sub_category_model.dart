class SubCategoryModel {
  final String id;
  final String categoryName;
  final String categoryServiceName;

  SubCategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryServiceName,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      categoryName: json['categoryName'],
      categoryServiceName: json['category_service_name'],
    );
  }
}
