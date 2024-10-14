import 'package:igreja/src/database/dao/member_dao.dart';
import 'package:igreja/src/database/datasource.dart';
import 'package:igreja/src/model/member_model.dart';
import 'package:igreja/src/repositories/member/member_repository.dart';
import 'package:sqflite/sqflite.dart';

class MemberRepositoryImpl extends MemberRepository {
  final DataSource _connection = DataSource.instance;

  Future<Database> _getDatabe() async {
    return _connection.db;
  }

  @override
  void add(MemberModel member) async {
    try {
      Database db = await _getDatabe();
      final Map<String, dynamic> m = member.toMap();
      if (m.isNotEmpty) {
        db.insert(MemberDao.nameTable, m);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<MemberModel>> findByAll() async {
    try {
      Database db = await _getDatabe();

      List<Map<String, dynamic>> listMember =
          await db.query(MemberDao.nameTable);

      List<MemberModel> m = MemberModel.fromList(listMember);

      return m;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  void update(MemberModel member) async {
    try {
      Database db = await _getDatabe();
      final Map<String, dynamic> m = member.toMap();
      db.update(MemberDao.nameTable, m);
    } catch (e) {
      print(e);
    }
  }

  @override
  void delete(MemberModel member) async {
    try {
      Database db = await _getDatabe();
      db.delete(MemberDao.nameTable,
          where: 'id = ?', whereArgs: [member.id.toString()]);
    } catch (e) {
      print(e);
    }
  }
}
