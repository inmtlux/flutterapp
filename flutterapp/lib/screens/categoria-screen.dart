import 'package:flutter/material.dart';
import 'package:primera_prueba/providers/categoria_provider.dart';
import 'package:provider/provider.dart';
import '../models/categoria.dart';

class CategoriaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoriaScreen();
}

class _CategoriaScreen extends State<CategoriaScreen> {
  @override
  Widget build(BuildContext context) {
    final categoriaProvider = Provider.of<CategoriaProvider>(context);
    final List<Producto> listaProductos = categoriaProvider.listaCategorias;
    // TODO: implement build
    return Center(
      child: ListView.builder(
        itemCount: listaProductos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              listaProductos[index].descripcion,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            subtitle: Text(
              "Cantidad de libros: " +
                  listaProductos[index].cantidadlibros.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            leading: Icon(Icons.bookmark),
          );
        },
      ),
    );
  }
}
    /*return   Center(
          child: Container(
            child: Text('categorias', style: TextStyle(fontSize: 20.0),),
          ),
      );
}}*/