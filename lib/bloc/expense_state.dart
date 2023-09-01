part of 'expense_bloc.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  List<ExpenseModel> listExpenses;
  ExpenseLoaded({required this.listExpenses});
}

class ExpenseError extends ExpenseState {
  String errorMsg;
  ExpenseError({required this.errorMsg});
}
