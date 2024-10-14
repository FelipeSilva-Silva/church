class MemberDao {
  static const String nameTable = 'tb_member';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _surName = 'surName';
  static const String _dateOfBirthDay = 'dateOfBirthDay';
  static const String _cpf = 'cpf';
  static const String _age = 'age';
  static const String _phone = 'phone';
  static const String _maritalStatus = 'maritalStatus';
  static const String _cep = 'cep';
  static const String _uf = 'uf';
  static const String _city = 'city';
  static const String _address = 'address';
  static const String _neighborhood = 'neighborhood';
  static const String _congregation = 'congregation';
  static const String _baptized = 'baptized';
  static const String _status = 'status';
  static const String _dateOfBaptized = 'dateOfBaptized';
  static const String _obs = 'obs';

  static const table = '''
    CREATE TABLE $nameTable(

      $_id INTEGER PRIMARY KEY AUTOINCREMENT,
      $_name VACHAR (70),
      $_surName VARCHAR(30),
      $_dateOfBirthDay VARCHAR(10),
      $_cpf VACHAR (11) UNIQUE,
      $_age INTEGER,
      $_phone VARCHAR (11),
      $_maritalStatus VARCHAR (10),
      $_cep VARCHAR (8),
      $_uf CHARACTER (2),
      $_city VARCHAR (30),
      $_address VARCHAR (40),
      $_neighborhood VARCHAR (30),
      $_congregation VARCHAR (40),
      $_baptized BOOLEAN,
      $_status VARCHAR (40),
      $_dateOfBaptized VARCHAR (10),
      $_obs TEXT
    );
  ''';
}
