import 'package:estados/models/usuario.dart';
import 'package:estados/services/service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: usuarioService.usuarioStream,
      builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              snapshot.hasData ? snapshot.data!.nombre! : "Pagina 2",
              // style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botones(() {
                  final nuevoUsuario =
                      Usuario(nombre: "Yardiel", edad: 26, profesiones: []);
                  usuarioService.cargarUsuario(nuevoUsuario);
                }, 'Establecer Usuario'),
                _botones(() {
                  usuarioService.cambiarEdad(27);
                }, 'Cambiar Edad'),
                _botones(() {}, 'Añadir Profesion'),
              ],
            ),
          ),
        );
      },
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
