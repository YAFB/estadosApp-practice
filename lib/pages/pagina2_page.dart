import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pagina 2",
          // style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botones(() {
              final newUser = Usuario(
                  nombre: 'Yardiel',
                  edad: 26,
                  profesiones: ['Fullstack developer', 'videojugador']);
              usuarioCubit.seleccionarUsuario(newUser);
            }, 'Establecer Usuario'),
            _botones(() {
              usuarioCubit.cambiarEdad(27);
            }, 'Cambiar Edad'),
            _botones(() {
              usuarioCubit.agregarProfesion();
            }, 'Añadir Profesion'),
          ],
        ),
      ),
    );
  }

  MaterialButton _botones(void Function() onPress, String texto) {
    return MaterialButton(
      onPressed: onPress,
      color: Colors.blue[400],
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
