import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
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
            _botones(() {}, 'Establecer Usuario'),
            _botones(() {}, 'Cambiar Edad'),
            _botones(() {}, 'Añadir Profesion'),
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
