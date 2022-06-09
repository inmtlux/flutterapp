import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:primera_prueba/providers/categoria_provider.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:primera_prueba/screens/cat-terror.dart';
import 'package:primera_prueba/screens/categoria-screen.dart';
import 'package:primera_prueba/screens/create-new-cuenta.dart'; //aca
import 'package:primera_prueba/screens/inicio-screen.dart';
import 'package:primera_prueba/screens/login-screen.dart';
import 'package:primera_prueba/screens/terr-cat-screen.dart';
import 'package:primera_prueba/screens/usuarios.dart';
import 'package:primera_prueba/widgets/my-custom-scroll.dart';
import 'package:primera_prueba/widgets/splash.dart';
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
        initialRoute: 'splash',
        routes: {
          '/': (context) => LoginScreen(),
          'splash': (_) => SplasScreen(),
          'Olvido la contraseña': (context) => ForgotPassword(),
          'Crear nueva cuenta': (context) => CreateNewAccounte(),
          'principal_screen': (_) => InicioScreen(),
          'categorias_screen': (_) => CategoriaScreen(),
          'usuarios_screen': (_) => UsuarioScreend(),
          "cat-terror": (_) => TerrorScreen(),//cambiar un rato
        },
      ),
    );
  }
}
