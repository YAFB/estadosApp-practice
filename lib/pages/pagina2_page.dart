import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
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
              usuarioCtrl.cargarUsuario(
                Usuario(
                  nombre: 'Yardiel',
                  edad: 26,
                  profesiones: ['Full stack'],
                ),
              );
              Get.snackbar(
                "",
                "Usuario seleccionado",
                backgroundColor: Colors.green[400],
                boxShadows: [
                  BoxShadow(color: Colors.black38, blurRadius: 10),
                ],
              );
            }, 'Establecer Usuario'),
            _botones(() {
              usuarioCtrl.cambiarEdad(27);
            }, 'Cambiar Edad'),
            _botones(() {
              usuarioCtrl.agregarProfesion('Profesion');
            }, 'Añadir Profesion'),
            _botones(() {
              Get.changeTheme(ThemeData.dark());
            }, "Cambiar tema")
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
