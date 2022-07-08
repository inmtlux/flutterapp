import 'package:flutter/material.dart';
import 'package:primera_prueba/models/usuario.dart';

class UsuarioSearchDelegate extends SearchDelegate<Usuario>{

  final List<Usuario> listaUsuarios;

  UsuarioSearchDelegate(this.listaUsuarios);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        onPressed: (){
          query = '';
        },
        icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return(
      IconButton(
        onPressed: (){
          close(context, 
          Usuario(
            id: '', 
            usuarioId: 0, 
            nombre: '', 
            email: '', 
            password: '', 
            estado: '', 
            rol: '', 
            img: '', 
            categoria: '')
            );
        }, 
        icon: Icon(Icons.book))
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final listaFiltrada = query.isEmpty ?
                          listaUsuarios :
                          listaUsuarios.where(
                            (usuario) => usuario.nombre.toLowerCase().contains(query.toLowerCase())
                            ).toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index){
        return _cardUsuario(listaFiltrada[index], context);
      },
    );
  }

}

Widget _cardUsuario(Usuario usuarioFiltrado, context){
  return Card(
    color: Colors.black,
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(usuarioFiltrado.img)),
          title: Text(usuarioFiltrado.nombre,style: TextStyle(color: Colors.white),),
          subtitle: Text(usuarioFiltrado.email,style: TextStyle(color: Colors.grey),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.pushNamed(context, 'usuario_actu',
            arguments: usuarioFiltrado);
          },
        )
      ],
    ),
  );
}