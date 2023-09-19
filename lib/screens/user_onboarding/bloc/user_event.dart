part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class CreateNewUserEvent extends UserEvent{
  UserModel newUser;
  CreateNewUserEvent({required this.newUser});
}

class LoginUserEvent extends UserEvent{
  String uname, pass;
  LoginUserEvent({required this.uname, required this.pass});
}


