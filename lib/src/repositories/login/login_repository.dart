import 'package:igreja/src/model/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> add(UserModel user);
  Future<bool> update(UserModel user);
  Future<List<UserModel>> findByAll();
}
