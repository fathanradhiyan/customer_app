part of 'databases.dart';

class CustomerDatabase {
  static final CustomerDatabase instance = CustomerDatabase._init();

  static Database? _database;

  CustomerDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('customers.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final custIdType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final custFirstNameType = 'TEXT NOT NULL';
    final custSurnameType = 'TEXT NOT NULL';
    final custNikType = 'TEXT';
    final custEmailType = 'TEXT NOT NULL';
    final custPhoneType = 'TEXT NOT NULL';
    final custAddressType = 'TEXT';

    await db.execute('''
    CREATE TABLE $tableCustomers(
    ${CustomerFields.custId} $custIdType,
    ${CustomerFields.custFirstName} $custFirstNameType, 
    ${CustomerFields.custSurname} $custSurnameType, 
    ${CustomerFields.custNik} $custNikType,
    ${CustomerFields.custEmail} $custEmailType,
    ${CustomerFields.custPhone} $custPhoneType,
    ${CustomerFields.custAddress} $custAddressType
    )
    ''');
  }

  Future<Customer> create(Customer item) async {
    final db = await instance.database;
    final id = await db.insert(tableCustomers, item.toJson());
    return item.copy(custId: id);
  }

  Future<Customer> readItem(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableCustomers,
      columns: CustomerFields.values,
      where: '${CustomerFields.custId} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Customer.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Customer>> readAllItems({String? search}) async {
    final db = await instance.database;

    final result = await db.query(tableCustomers,
      where: search != null? '${CustomerFields.custId} like ? or ${CustomerFields.custFirstName} like ?' : null,
      whereArgs: search != null? ['%$search%', '%$search%'] : null
    );

    return result.map((json) => Customer.fromJson(json)).toList();

  }

  Future<void> update(Customer item) async {
    final db = await instance.database;

    await db.update(
      tableCustomers,
      item.toJson(),
      where: '${CustomerFields.custId} = ?',
      whereArgs: [item.custId]
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableCustomers,
      where: '${CustomerFields.custId} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
