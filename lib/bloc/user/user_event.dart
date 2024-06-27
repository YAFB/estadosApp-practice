part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActiveUser extends UserEvent {
  final Usuario user;

  ActiveUser({required this.user});
}

class ChangeUserAge extends UserEvent {
  final int edad;

  ChangeUserAge({required this.edad});
}

class AddProfesion extends UserEvent {
  final String profesion;

  AddProfesion({required this.profesion});
}

class DeleteUser extends UserEvent {}
