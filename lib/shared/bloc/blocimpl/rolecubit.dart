import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/routes/auth/role_enum.dart';

class RoleCubit extends Cubit<UserRole?> {
  RoleCubit() : super(null);

  void setRole(UserRole role) {
    emit(role);
  }
}
