import 'package:mobile/shared/data/entity/entity.dart';
import 'package:mobile/shared/data/model/signup_model.dart';

class UserMapper {
  static User toEntity(SignupResponseModel model) {
    final user = User(name: model.name, email: model.email);

    return user;
  }
}
