import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/user/bloc/event/category_event.dart';
import 'package:mobile/user/bloc/state/category_state.dart';
import 'package:mobile/user/data/repositories/main_categories_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final MainCategoriesRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryInitial()) {
    on<FetchCategoriesEvent>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(
    FetchCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());

    try {
      final categories = await categoryRepository.getCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
