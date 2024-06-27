import 'package:estados/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  RxBool existeUsuario = false.obs;
  Rx<Usuario> user = Usuario().obs;

  int get profesionesCount => user.value.profesiones!.length;

  void cargarUsuario(Usuario usuario) {
    existeUsuario.value = true;
    user.value = usuario;
  }

  void cambiarEdad(int edad) {
    user.update(
      (val) {
        val!.edad = edad;
      },
    );
  }

  void agregarProfesion(String profesion) {
    user.update(
      (val) {
        val!.profesiones = [
          ...val.profesiones!,
          '$profesion ${profesionesCount + 1}'
        ];
      },
    );
  }
}
