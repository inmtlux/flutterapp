import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';
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

    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text('Categorias'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {}, //PENDIENTE
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: size.height * 0.7,
        color: Colors.white,
        child: Swiper(
          itemCount: listaCategorias.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.7,
          itemBuilder: (BuildContext context, int index) {
            return _cardCategorias(listaCategorias[index]);
          },
        ),
      ),
      /*body: Center(
          child: ListView.builder(
        itemCount: listaCategorias.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 20),
                width: double.infinity,
                height: 250,
                decoration: _cardBorders(),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    //_ImagenFondo(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: AssetImage('.........'),
                          //image: AssetImage('../assets/categoria-screen/sugerenciaCatg.jpg'),
                          image: NetworkImage(listaCategorias[index].img),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 153, 243, 98),
                      child: ListTile(
                        title: Text(
                          listaCategorias[index].descripcion,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 100, 19, 116)),
                        ),
                        subtitle: Text(
                          'Cantidad de libros:  ' +
                              listaCategorias[index].cantidadlibros.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                        leading: Icon(Icons.book),
                      ),
                    )
                  ],
                )),
          );
        },
      )),*/
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

class _cardCategorias extends StatelessWidget {
  final Categoria categoria;
  _cardCategorias(this.categoria);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 140, bottom: 20),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _ImagenFondo(categoria),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: Colors.amber,
            ),
            child: ListTile(
              title: Text(
                categoria.descripcion,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                'Cantidad de libros:  ' + categoria.cantidadlibros.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'categorias2_form_screen',
                      arguments: categoria);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final Categoria categoria;
  _ImagenFondo(this.categoria);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 300,
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder:
              AssetImage('../assets/categoria-screen/sugerenciaCatg.jpg'),
          //image: AssetImage('../assets/categoria-screen/sugerenciaCatg.jpg'),
          image: NetworkImage(categoria.img),
        ),
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
