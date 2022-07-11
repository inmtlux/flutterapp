import 'package:flutter/material.dart';
import 'package:primera_prueba/models/libro.dart';

class LibroSearchDelegate extends SearchDelegate<Libro> {
  final List<Libro> listaLibro;

  LibroSearchDelegate(this.listaLibro);

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
            Libro(
                id: '',
                libroId: 0,
                descripcion: '',
                autor: '',
                img: '',
                categoria: '',
                ));
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
        ? listaLibro
        : listaLibro
            .where((Libro) => Libro.descripcion
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardLibro(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardLibro(Libro libroFiltrada, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(libroFiltrada.img),
          ),
          title: Text(libroFiltrada.descripcion),
          subtitle: Text('Autor: ${libroFiltrada.autor}'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, 'libro_form_update',
                arguments: libroFiltrada);
          },
        ),
      ],
    ),
  );
}
