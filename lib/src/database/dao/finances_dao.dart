class FinancesDao {
  static const String nameTable = 'tb_finances';
  static const String _id = 'id';
  static const String _description = 'description';
  static const String _value = 'value';
  static const String _date = 'date';
  static const String _category = 'category';
  static const String _wayToreceive = 'wayToreceive';
  static const String _type = 'type';

  static const String table = '''
      CREATE TABLE $nameTable (
        $_id INTEGER PRIMARY KEY AUTOINCREMENT,
        $_description TEXT,
        $_value REAL,
        $_date VARCHAR(10),
        $_category VARCHAR,
        $_wayToreceive VARCHAR(20),
        $_type BOOLEAN
      );  
    ''';
}
