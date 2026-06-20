class CategoryModel {
  final String id;
  final String categoryName;
  final String categoryImage;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      categoryName: json['category_name'],
      categoryImage: json['category_image'],
    );
  }
}
