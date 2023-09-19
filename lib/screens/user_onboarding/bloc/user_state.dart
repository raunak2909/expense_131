part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {}

class UserFailState extends UserState {
  String failMsg;
  UserFailState({required this.failMsg});
}
