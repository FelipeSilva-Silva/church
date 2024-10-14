import 'package:flutter/foundation.dart';
import 'package:igreja/src/database/datasource.dart';
import 'package:igreja/src/model/user_model.dart';
import 'package:igreja/src/repositories/login/login_repository.dart';
import 'package:sqflite/sqflite.dart';

class LoginRepositoryImp extends LoginRepository {
  final DataSource _connection = DataSource.instance;

  Future<Database> _getDatabase() async {
    return await _connection.db;
  }

  @override
  Future<UserModel> add(UserModel user) {
    throw UnimplementedError();
  }

  @override
  Future<bool> update(UserModel user) {
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> findByAll() async {
    try {
      Database database = await _getDatabase();
      List<Map<String, dynamic>> lines = await database.query('tb_login');
      if (kDebugMode) {
        print(lines);
      }
      List<UserModel> users = UserModel.toListUsermodel(lines);
      return users;
    } catch (e) {
      throw Exception(e);
    }
  }
}
