import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActiveUser>((event, emit) => emit(UserSetState(event.user)));

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.edad)));
    });

    on<AddProfesion>((event, emit) {
      if (!state.existUser) return;
      final List<String> profesiones = [
        ...state.user!.profesiones,
        '${event.profesion} ${state.user!.profesiones.length + 1}'
      ];

      emit(UserSetState(state.user!.copyWith(profesiones: profesiones)));
    });

    on<DeleteUser>((event, emit) => emit(const UserInitialState()));
  }
}
