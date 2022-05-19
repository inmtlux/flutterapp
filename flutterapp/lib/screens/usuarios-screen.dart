import 'package:flutter/material.dart';
import 'package:primera_prueba/models/usuario.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:provider/provider.dart';

class UsuarioScreen extends StatefulWidget {
  @override
  createState() => _UsuarioScreen();
}

class _UsuarioScreen extends State<UsuarioScreen>{
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<Usuario> listaUsuarios = usuarioProvider.listaUsuarios;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('hola')),
      body: Center(
        child: ListView.builder(
          itemCount: listaUsuarios.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(listaUsuarios[index].nombre),
            );
          },
        )
      ),
    );
  }
}