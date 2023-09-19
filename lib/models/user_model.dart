import 'package:expense_131/database_provider/app_database.dart';

class UserModel {
  int? u_id;
  String email;
  String mobno;
  String pass;
  String gender;

  UserModel(
      {this.u_id,
      required this.email,
      required this.mobno,
      required this.pass,
      required this.gender});

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      u_id: map[AppDataBase.USER_COLUMN_ID],
      email: map[AppDataBase.USER_COLUMN_EMAIL],
      mobno: map[AppDataBase.USER_COLUMN_MOB_NO],
      pass: map[AppDataBase.USER_COLUMN_PASS],
      gender: map[AppDataBase.USER_COLUMN_GENDER]);

  Map<String, dynamic> toMap() => {
        AppDataBase.USER_COLUMN_ID: u_id,
        AppDataBase.USER_COLUMN_EMAIL: email,
        AppDataBase.USER_COLUMN_MOB_NO: mobno,
        AppDataBase.USER_COLUMN_PASS: pass,
        AppDataBase.USER_COLUMN_GENDER: gender,
      };
}
