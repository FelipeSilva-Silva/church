import 'package:igreja/src/database/dao/finances_dao.dart';
import 'package:igreja/src/database/datasource.dart';
import 'package:igreja/src/model/finances_model.dart';
import 'package:igreja/src/repositories/finances/finances_repository.dart';
import 'package:sqflite/sqflite.dart';

class FinancesRepositoryImpl extends RepositoryFinances {
  DataSource dataSource = DataSource.instance;

  Future<Database> _getDatabase() async {
    return await dataSource.db;
  }

  @override
  void add(FinancesModel finances) async {
    try {
      Database db = await _getDatabase();
      final Map<String, dynamic> f = finances.toMap();
      db.insert(FinancesDao.nameTable, f);
    } catch (e) {
      print(e);
    }
  }

  @override
  void delete(FinancesModel finances) async {
    try {
      Database db = await _getDatabase();
      db.delete(FinancesDao.nameTable,
          where: 'id = ?', whereArgs: [finances.id.toString()]);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<FinancesModel>> findByAll() async {
    try {
      Database db = await _getDatabase();
      List<Map<String, dynamic>> listFincances =
          await db.query(FinancesDao.nameTable);
      return FinancesModel.fromList(listFincances);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  void update(FinancesModel finances) async {
    try {
      Database db = await _getDatabase();
      final Map<String, dynamic> f = finances.toMap();
      db.update(FinancesDao.nameTable, f);
    } catch (e) {
      print(e);
    }
  }
}
