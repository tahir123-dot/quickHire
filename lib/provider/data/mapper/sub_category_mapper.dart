import '../entity/sub_category_entity.dart';
import '../model/sub_category_model.dart';

class SubCategoryMapper {
  static SubCategoryEntity toEntity(SubCategoryModel model) {
    return SubCategoryEntity(
      id: model.id,
      categoryName: model.categoryName,
      categoryServiceName: model.categoryServiceName,
    );
  }

  // list ke liye - ek call mein sari list convert
  static List<SubCategoryEntity> toEntityList(List<SubCategoryModel> models) {
    return models.map((m) => toEntity(m)).toList();
  }
}
