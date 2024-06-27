import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pagina 1",
          // style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => usuarioCtrl.existeUsuario.value
            ? InformacionUsuario(usuario: usuarioCtrl.user.value)
            : const NoInfo(),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.of(context).pushNamed('pagina2'),
        onPressed: () => Get.toNamed('pagina2', arguments: {
          'nombre': 'Yardiel',
          'edad': 26,
        }),
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay informacion del usuario'),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    super.key,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            title: Text("Nombre: ${usuario.nombre}"),
          ),
          ListTile(
            title: Text("Edad: ${usuario.edad}"),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...usuario.profesiones!.map(
            (profesion) => ListTile(
              title: Text(profesion),
            ),
          )
        ],
      ),
    );
  }
}
