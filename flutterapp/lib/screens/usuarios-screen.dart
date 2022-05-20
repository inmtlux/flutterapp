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
      
      backgroundColor: Colors.white,
      body: 
      Container(
        child: Center(
          child: ListView.builder(
            itemCount: listaUsuarios.length,
            itemBuilder: (context, index){
              return Card(
                color: Colors.grey,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(listaUsuarios[index].nombre,style: TextStyle(color: Colors.black),),
                      subtitle: Text(listaUsuarios[index].email,style: TextStyle(color: Colors.black),),
                      leading: Icon(Icons.person,color: Colors.black),
                    ),
                  ],
                ),
              );
            },
          )
        ),
      ),
    );
  }
}