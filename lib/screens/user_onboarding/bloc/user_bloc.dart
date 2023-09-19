import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../database_provider/app_database.dart';
import '../../../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  AppDataBase db;
  UserBloc({required this.db}) : super(UserInitialState()) {
    on<CreateNewUserEvent>((event, emit) async{
      emit(UserLoadingState());

      bool check = await db.createNewAccount(event.newUser);

      if(check){
        emit(UserSuccessState());
      } else {
        emit(UserFailState(failMsg: "Email Already Exists!!"));
      }

    });

    on<LoginUserEvent>((event, emit) async{

      emit(UserLoadingState());

      bool check = await db.authenticateUser(event.uname, event.pass);

      if(check){
        emit(UserSuccessState());
      } else {
        emit(UserFailState(failMsg: "Invalid UserName or Password!!"));
      }

    });
  }
}
