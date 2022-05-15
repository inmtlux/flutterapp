import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primera_prueba/screens/categoria-screen.dart';
import 'package:primera_prueba/screens/login-screen.dart';
import 'package:primera_prueba/screens/principal-screen.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        'categorias_screen': (_) => CategoriaScreen()
      },
    );
  }
}


