import 'package:estados/pages/pagina1_page.dart';
import 'package:estados/pages/pagina2_page.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioService()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.blue[400]!,
            onPrimary: Colors.white,
            surface: Colors.blue[400]!,
            onSurface: Colors.black,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue[400],
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => const Pagina1Page(),
          'pagina2': (_) => const Pagina2Page(),
        },
      ),
    );
  }
}
// estadosApp-practice
// 
// Uso de diferentes manejadores de estado en flutter (singleton, provider,cubit,patronBloc)

