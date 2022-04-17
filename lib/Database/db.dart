import 'package:sqflite/sqflite.dart';
import 'package:task1spark/Data.dart';

late Database database;
List<Customer>? customerList2 = [];
void createDatabase() {
  if(customerList2!.length>0)
  {
    customerList2!.clear();
  }

  print(customerList2!.length.toString());
  customerList2 = [];
  openDatabase('customers.db', version: 1,
      onCreate: (Database database, int version) {
    print('Create database');
    database.execute(
      'CREATE TABLE customer (id INTEGER PRIMARY KEY, name TEXT, email TEXT, balance INTEGER )',
    );
  }, onOpen: (database) {
    getFromDatabase(database);
    print('open database');
  }).then((value) {
    database = value;
    print("Table created");
    add();
  }).catchError((error) {
    print("Error in creation of database" + error.toString());
  });
}

void getFromDatabase(database) {
  if(customerList2!.length>0)
    {
      customerList2!.clear();
    }

  print(customerList2!.length.toString());
  customerList2 = [];

  database.rawQuery('SELECT * FROM customer').then((value) {
    value.forEach((element) {
      Customer customer =
          Customer(element['name'], element['email'], element['balance']);
      customerList2!.add(customer);
    });
  });
  print(customerList2!.length.toString());
}

Future insertToDatabase(
  String name,
  String email,
  int balance,
) async {
  await database.transaction((txn) async {
    txn
        .rawInsert(
      'INSERT INTO customer(name, email, balance) VALUES("$name", "$email", "$balance")',
    )
        .then((value) {
      print("$value inserted successfully");
      getFromDatabase(database);
    }).catchError((error) {
      print("Error When Inserting New Data ${error.toString()}");
    });
  });
}

Future updateDatabase({required int balance, required int id}) async {
  database.rawUpdate('UPDATE customer SET balance=? Where id=?',
      ['$balance', id]).then((value) {
    getFromDatabase(database);
  });
}

void add() {
  insertToDatabase("Nada Hossam", "nada@gmail.com", 30000);
  insertToDatabase("Shahy Yehia", "shahy@gmail.com", 2000);
  insertToDatabase("Omnia Fares", "omnia@gmail.com", 1000);
  insertToDatabase("Nadah Khaled", "nadah@gmail.com", 1000);
  insertToDatabase("Hossam Mohamed", "hossam@gmail.com", 4000);
  insertToDatabase("Alaa Fathy", "alaa@gmail.com", 5000);
  insertToDatabase("Fatma Anwar", "fatma@gmail.com", 1500);
  insertToDatabase("Farah Hossam", "shahy@gmail.com", 2000);
  insertToDatabase("Assem Hossam", "assem@gmail.com", 7000);
  insertToDatabase("Mohamed Mohsen", "mohsen@gmail.com", 8000);
  insertToDatabase("Rewan Hossam", "shahy@gmail.com", 9000);
}
