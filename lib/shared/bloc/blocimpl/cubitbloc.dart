import 'package:flutter_bloc/flutter_bloc.dart';

class RoleCubit extends Cubit<String?> {
  RoleCubit() : super(null);

  void selectRole(String role) {
    emit(role);
  }

  void clearRole() {
    emit(null);
  }
}
