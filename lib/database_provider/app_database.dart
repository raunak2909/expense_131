import 'dart:io';

import 'package:expense_131/models/expense_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  //for singleton database class
  AppDataBase._();

  static final AppDataBase db = AppDataBase._();

  //database variable
  Database? _database;

  //expense
  static final EXPENSE_TABLE = "expense";

  static const EXPENSE_COLUMN_ID = "exp_id";
  //static const USER_COLUMN_ID = "uid";
  static const EXPENSE_COLUMN_TITLE = "exp_title";
  static const EXPENSE_COLUMN_DESC = "exp_desc";
  static const EXPENSE_COLUMN_AMT = "exp_amt";
  static const EXPENSE_COLUMN_BAL = "exp_bal";
  static const EXPENSE_COLUMN_TYPE = "exp_type"; //0 -> debit & 1 -> Credit
  static const EXPENSE_COLUMN_CAT_ID = "exp_cat_id";
  static const EXPENSE_COLUMN_TIME = "exp_time";



  //user
  static const USER_TABLE = "user";
  static const USER_COLUMN_ID = "uid";
  static const USER_COLUMN_EMAIL = "email";
  static const USER_COLUMN_MOB_NO = "mobno";
  static const USER_COLUMN_PASS = "pass";
  static const USER_COLUMN_GENDER = "gender";

  Future<Database> getDB() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDB();
      return _database!;
    }
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    var dbPath = join(documentDirectory.path, "expenseDB.db");

    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      //create tables here
      db.execute(
          "Create table $EXPENSE_TABLE ( $EXPENSE_COLUMN_ID integer primary key autoincrement, $USER_COLUMN_ID integer, $EXPENSE_COLUMN_TITLE text, $EXPENSE_COLUMN_DESC text, $EXPENSE_COLUMN_AMT real, $EXPENSE_COLUMN_BAL real, $EXPENSE_COLUMN_TYPE integer, $EXPENSE_COLUMN_CAT_ID integer, $EXPENSE_COLUMN_TIME String )");
      db.execute(
          "Create table $USER_TABLE ( $USER_COLUMN_ID integer primary key autoincrement, $USER_COLUMN_EMAIL text unique, $USER_COLUMN_PASS text, $USER_COLUMN_GENDER text, $USER_COLUMN_MOB_NO text )");
    });
  }

  //createAccount
  Future<bool> createNewAccount(String email) async {
    bool check = await checkIfEmailAlreadyExists(email);
    var db = await getDB();
    if (!check) {
      //insert
      var isInserted = await db.insert(USER_TABLE, {});
      return isInserted > 0;
    } else {
      return false;
    }
  }

//checking if user exists
  Future<bool> checkIfEmailAlreadyExists(String email) async {
    var db = await getDB();

    var data = await db
        .query(USER_TABLE, where: "$USER_COLUMN_EMAIL = ?", whereArgs: [email]);

    return data.isNotEmpty;
  }

//Authenticating User

  Future<bool> authenticateUser(String email, String pass) async {
    var db = await getDB();

    var data = await db.query(USER_TABLE,
        where: "$USER_COLUMN_EMAIL = ? and $USER_COLUMN_PASS = ?",
        whereArgs: [email, pass]);

    //shared pref
    // set uid
    return data.isNotEmpty;
  }

  /// Expense Table operations

  Future<bool> addExpense(ExpenseModel newExpense) async{
    var db = await getDB();

    int check = await db.insert(EXPENSE_TABLE, newExpense.toMap());

    return check>0;
  }

  Future<List<ExpenseModel>> getAllExpensesOfUser(int uid) async{
    var db = await getDB();

    //get uid via shared pref
    // get uid

    List<Map<String, dynamic>> data = await db.query(EXPENSE_TABLE, where: "$USER_COLUMN_ID = ?", whereArgs: ["$uid"]);

    List<ExpenseModel> listExpenses = [];

    for(Map<String, dynamic> eachExpense in data){
      listExpenses.add(ExpenseModel.fromMap(eachExpense));
    }

    return listExpenses;
  }

}
