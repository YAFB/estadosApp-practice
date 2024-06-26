import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          usuarioService.existeUsuario
              ? usuarioService.usuario.nombre!
              : "Pagina 2",
          // style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botones(() {
              final newUsuario = Usuario(
                  nombre: "Yardiel",
                  edad: 26,
                  profesiones: ['full stack developer', 'videojugador']);
              usuarioService.usuario = newUsuario;
            }, 'Establecer Usuario'),
            _botones(() {
              usuarioService.cambiarEdad(27);
            }, 'Cambiar Edad'),
            _botones(() {
              usuarioService.agregarProfesion();
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
