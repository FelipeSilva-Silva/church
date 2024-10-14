import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:igreja/src/database/dao/finances_dao.dart';
import 'package:igreja/src/database/dao/login_dao.dart';
import 'package:igreja/src/database/dao/member_dao.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataSource {
  DataSource._();

  static DataSource? _instance;

  static DataSource get instance {
    _instance ??= DataSource._();
    return _instance!;
  }

  Database? _database;

  Future<Database> get db {
    return _openDatabase();
  }

  Future<Database> _openDatabase() async {
    debugPrint('Iniciando a abertura do banco de dados...');
    sqfliteFfiInit();
    String databasePath = await databaseFactoryFfi.getDatabasesPath();
    String path = join(databasePath, 'igreja.db');
    DatabaseFactory databaseFactory = databaseFactoryFfi;
    await databaseFactory.deleteDatabase(path);
    debugPrint('Abrindo o banco de dados...');
    _database ??= await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(onCreate: _onCreate, version: 1));
    debugPrint('Banco de dados aberto com sucesso!');
    return _database!;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    debugPrint('Criando a tabela tb_login...');
    db.transaction((reference) async {
      reference.execute(LoginDao.table);
      reference.execute(MemberDao.table);
      reference.execute(FinancesDao.table);
      reference.insert('tb_login', {
        'name': 'felipe',
        'userName': 'admin',
        'password': 'admin',
        'initMandateDate': DateTime.now().toString(),
        'finalMandatelDate':
            DateTime.now().add(const Duration(days: 365)).toString()
      });
      debugPrint('Tabela criadas com sucesso!');
    });
  }
}
