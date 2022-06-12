import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:primera_prueba/models/categoria.dart';
import 'package:primera_prueba/providers/categoria_provider.dart';

class Categoria2Screen extends StatefulWidget {
  @override
  createState() => _Categorias2Screen();
}

class _Categorias2Screen extends State<Categoria2Screen> {
  @override
  Widget build(BuildContext context) {
    final categoriaProvider = Provider.of<CategoriaProvider>(context);
    final List<Categoria> listaCategorias = categoriaProvider.listaCategorias;

    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: listaCategorias.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 20),
                width: double.infinity,
                height: 200,
                decoration: _cardBorders(),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    _ImagenFondo(),
                    Container(
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(
                          listaCategorias[index].descripcion,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                        subtitle: Text(
                          'Cantidad de libros disponibles:  ' +
                              listaCategorias[index].cantidadlibros.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                        leading: Icon(Icons.card_giftcard),
                      ),
                    )
                  ],
                )),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'categorias2_form_screen');
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 200,
        child: FadeInImage(
            placeholder:
                AssetImage('../assets/categoria-screen/sugerenciaCatg.jpg'),
            image: AssetImage('../assets/categoria-screen/sugerenciaCatg.jpg'),

            // NetworkImage('https://placeimg.com/400/300/tech'),
            fit: BoxFit.cover),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);