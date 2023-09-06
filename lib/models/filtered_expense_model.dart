import 'expense_model.dart';

class FilteredExpenseModel {
  String dateName;
  num totalAmt;
  List<ExpenseModel> arrExpenses;

  FilteredExpenseModel(
      {required this.dateName,
      required this.totalAmt,
      required this.arrExpenses});
}
