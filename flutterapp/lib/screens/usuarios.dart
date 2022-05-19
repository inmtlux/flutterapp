import 'package:flutter/material.dart';
import 'package:primera_prueba/models/usuario.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:primera_prueba/screens/categoria-screen.dart';
import 'package:primera_prueba/screens/inicio-screen.dart';
import 'package:primera_prueba/screens/login-screen.dart';
import 'package:provider/provider.dart';

class UsuarioScreend extends StatefulWidget {
  @override
  State<UsuarioScreend> createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreend> {
  @override
  Widget build(BuildContext context) {

    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<Usuario> listaUsuarios = usuarioProvider.listaUsuarios;

    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor:Colors.black,
          body: CustomScrollView(
            slivers: <Widget>[
    SliverAppBar(  
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 160,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Usuarios',style: TextStyle(),),
        centerTitle: true,
        background: ShaderMask(
          shaderCallback: (rect) => LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.transparent],
              ).createShader(rect),
              blendMode: BlendMode.darken,
          child: Container(decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/libros.jpg'),
            fit: BoxFit.cover,
            ),
          ),
          ),
        ),
      ),
    ),
    SliverFillRemaining(
      child:Container()
    ),
            ],
          ),
          
          
          ),
      ],
    );
  }
}