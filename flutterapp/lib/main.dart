import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primera_prueba/providers/categoria_provider.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:primera_prueba/screens/cat-terror.dart';
import 'package:primera_prueba/screens/categoria-screen.dart';
import 'package:primera_prueba/screens/create-new-cuenta.dart'; //aca
import 'package:primera_prueba/screens/login-screen.dart';
import 'package:primera_prueba/screens/principal-screen.dart';
import 'package:primera_prueba/screens/usuarios-screen.dart';
import 'package:primera_prueba/screens/usuarios.dart';
import 'package:primera_prueba/widgets/my-custom-scroll.dart';
import 'package:provider/provider.dart';
import 'screens/categoria_form_screen.dart';
import 'screens/categoria_screen2.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => CategoriaProvider(), lazy: false),
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Prueba login',
        theme: ThemeData(
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          'Olvido la contraseña': (context) => ForgotPassword(),
          'Crear nueva cuenta': (context) => CreateNewAccount(),
          'principal_screen': (_) => PrincipalScreen(),
          'categorias_screen': (_) => CategoriaScreen(),
          'categorias2_screen': (_) => Categoria2Screen(),
          'categorias2_form_screen': (_) => CategoriaFormScreen(),
          'usuarios_screen': (_) => UsuarioScreen(),
          "cat-terror": (_) => CategoriaTScreen(),
        },
      ),
    );
  }
}
