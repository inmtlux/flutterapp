import 'package:flutter/material.dart';
import 'package:primera_prueba/models/categoria.dart';

class CategoriaSearchDelegate extends SearchDelegate<Categoria> {
  final List<Categoria> listaCategorias;

  CategoriaSearchDelegate(this.listaCategorias);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.blueAccent,
      ),
      onPressed: () {
        close(
            context,
            Categoria(
                id: '',
                categoriaId: 0,
                descripcion: '',
                cantidadlibros: 0,
                img: '',
                categoria: '',
                estado: 'false'));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaCategorias
        : listaCategorias
            .where((Categoria) => Categoria.descripcion
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardCategoria(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardCategoria(Categoria categoriaFiltrada, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(categoriaFiltrada.img),
          ),
          title: Text(categoriaFiltrada.descripcion),
          subtitle: Text('Cantidad: ${categoriaFiltrada.cantidadlibros}'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, 'categorias2_form_screen',
                arguments: categoriaFiltrada);
          },
        ),
      ],
    ),
  );
}
