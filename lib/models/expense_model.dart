import 'package:expense_131/database_provider/app_database.dart';

class ExpenseModel {
  int? exp_id;
  int u_id;
  String exp_title;
  String exp_desc;
  num exp_amt;
  num exp_bal;
  int exp_type;
  int expe_cat_id;
  String exp_time;

  ExpenseModel({this.exp_id,
    required this.u_id,
    required this.exp_title,
    required this.exp_desc,
    required this.exp_amt,
    required this.exp_bal,
    required this.exp_type,
    required this.expe_cat_id,
    required this.exp_time});

  factory ExpenseModel.fromMap(Map<String, dynamic> map) =>
      ExpenseModel(
          exp_id: map[AppDataBase.EXPENSE_COLUMN_ID],
          u_id: map[AppDataBase.USER_COLUMN_ID],
          exp_title: map[AppDataBase.EXPENSE_COLUMN_TITLE],
          exp_desc: map[AppDataBase.EXPENSE_COLUMN_DESC],
          exp_amt: map[AppDataBase.EXPENSE_COLUMN_AMT],
          exp_bal: map[AppDataBase.EXPENSE_COLUMN_BAL],
          exp_type: map[AppDataBase.EXPENSE_COLUMN_TYPE],
          expe_cat_id: map[AppDataBase.EXPENSE_COLUMN_CAT_ID],
          exp_time: map[AppDataBase.EXPENSE_COLUMN_TIME]);


Map<String, dynamic> toMap() =>
    {

      AppDataBase.EXPENSE_COLUMN_ID: exp_id,
      AppDataBase.USER_COLUMN_ID: u_id,
      AppDataBase.EXPENSE_COLUMN_TITLE: exp_title,
      AppDataBase.EXPENSE_COLUMN_DESC: exp_desc,
      AppDataBase.EXPENSE_COLUMN_AMT: exp_amt,
      AppDataBase.EXPENSE_COLUMN_BAL: exp_bal,
      AppDataBase.EXPENSE_COLUMN_TYPE: exp_type,
      AppDataBase.EXPENSE_COLUMN_CAT_ID: expe_cat_id,
      AppDataBase.EXPENSE_COLUMN_TIME: exp_time,

    };}
