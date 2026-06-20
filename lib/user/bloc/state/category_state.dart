import 'package:mobile/user/data/model/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

// Loading
class CategoryLoading extends CategoryState {}

// Data
class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;
  CategoryLoaded({required this.categories});
}

// Error
class CategoryError extends CategoryState {
  final String message;
  CategoryError({required this.message});
}
