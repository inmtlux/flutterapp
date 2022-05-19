import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:primera_prueba/screens/categoria-screen.dart';
import 'package:primera_prueba/screens/login-screen.dart';
import 'package:primera_prueba/screens/principal-screen.dart';
import 'package:primera_prueba/screens/usuarios-screen.dart';
=======
import 'package:primera_prueba/providers/producto_provider.dart';
import 'package:primera_prueba/screens/categoria-screen.dart';
import 'package:primera_prueba/screens/login-screen.dart';
import 'package:primera_prueba/screens/principal-screen.dart';
import 'package:primera_prueba/screens/producto_form_screen.dart';
import 'package:primera_prueba/screens/producto_screen.dart';
>>>>>>> 2a675545bcf7843c1a4b93827094a779f9a3bd1a
import 'package:primera_prueba/screens/usuarios.dart';
import 'package:primera_prueba/widgets/my-custom-scroll.dart';
import 'package:provider/provider.dart';
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
<<<<<<< HEAD
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
      ],
      child: MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Prueba login',
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(Theme.of
        (context).textTheme),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> LoginScreen(),
        'Olvido la contraseña':(context)=> ForgotPassword(),
        'Crear nueva cuenta': (context) => CreateNewAccount(),
        'principal_screen': (_) => PrincipalScreen(),
        'categorias_screen': (_) => CategoriaScreen(),
        'usuarios_screen': (_)=> UsuarioScreen(),
      },
    ),
      );
=======
        ChangeNotifierProvider(create: (_) => ProductoProvider(), lazy: false),
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
          'usuarios_screen': (_) => UsuarioScreen(),
          'ruta_productos': (_) => ProductoScreen(),
          'ruta_productos_form': (_) => ProductoFormScreen(),
        },
      ),
    );
>>>>>>> 2a675545bcf7843c1a4b93827094a779f9a3bd1a
  }
}
