import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../database_provider/app_database.dart';
import '../models/expense_model.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  AppDataBase db;
  ExpenseBloc({required this.db}) : super(ExpenseInitial()) {

    on<AddExpenseEvent>((event, emit) async{
      emit(ExpenseLoading());
      bool check = await db.addExpense(event.newExpense);
      if(check){
        var expenses = await db.getAllExpensesOfUser();
        emit(ExpenseLoaded(listExpenses: expenses));
      } else {
        emit(ExpenseError(errorMsg: "Expense not Added!!"));
      }
    });

    on<FetchAllExpenseEvent>((event, emit) async{
      emit(ExpenseLoading());
      var expenses = await db.getAllExpensesOfUser();
      emit(ExpenseLoaded(listExpenses: expenses));
    });
  }
}
