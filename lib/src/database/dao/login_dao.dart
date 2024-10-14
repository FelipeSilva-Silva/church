class LoginDao {
  static const String _nameTable = 'tb_login';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _userName = 'userName';
  static const String _password = 'password';
  static const String _finalMandatelDate = 'finalMandatelDate';
  static const String _initMandateDate = 'initMandateDate';

  static const String table = '''
    CREATE TABLE $_nameTable ( 
      $_id INTEGER PRIMARY KEY AUTOINCREMENT,
      $_name VARCHAR (70),
      $_userName VARCHAR(20),
      $_password VARCHAR(30),
      $_initMandateDate Text,
      $_finalMandatelDate Text
    );
  ''';
}
