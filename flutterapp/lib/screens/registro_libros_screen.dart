import 'package:flutter/material.dart';
import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/providers/libro_provider.dart';
//import 'package:primera_prueba/providers/registro_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/menu_lateral.dart';
import 'package:card_swiper/card_swiper.dart';
import '../search/libro_search_delegate.dart';

class RegistroScreen extends StatefulWidget {
  @override
  createState() => _RegistroScreen();
}

class _RegistroScreen extends State<RegistroScreen> {
  @override
  Widget build(BuildContext context) {
    final libroProvider = Provider.of<LibroProvider>(context);
    final List<Libro> listaLibros = libroProvider.listaLibros;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text('Registro de libros'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: LibroSearchDelegate(listaLibros));
            }, //PENDIENTE
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: size.height * 0.7,
        color: Colors.white,
        child: Swiper(
          itemCount: listaLibros.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.7,
          itemBuilder: (BuildContext context, int index) {
            return _cardLibros(listaLibros[index]);
          },
        ),
      ),



      /*body: Center(
          child: ListView.builder(
        itemCount: listaLibros.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 20),
                width: 300,
                height: 300,
                decoration: _cardBorders(),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    //_ImagenFondo(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        child: FadeInImage(
                            placeholder: AssetImage(
                                '../assets/terror-screen/horror.jpg'),
                            image: NetworkImage(listaLibros[index].img),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 71, 126, 170),
                      child: ListTile(
                        title: Text(
                          listaLibros[index].descripcion,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 100, 19, 116)),
                        ),
                        subtitle: Text(
                          'Autor:  ' +
                              listaLibros[index].autor.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 23, 30, 69)),
                        ),
                        leading: Icon(Icons.book),
                      ),
                    )
                  ],
                )),
          );
        },
      )
      ),
      */
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'libro_form_screen');
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}


class _cardLibros extends StatelessWidget {
  final Libro libro;
  _cardLibros(this.libro);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 140, bottom: 20),
      width: double.infinity,
      height: size.height * 0.7,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _ImagenFondo(libro),
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
                libro.descripcion,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
              'Autor:  ' + libro.autor.toString(),
              style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.indigo),
                        ),
              leading: Icon(Icons.book),
              trailing: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'libro_form_screen',
                      arguments: libro);
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
  final Libro libro;
  _ImagenFondo(this.libro);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 350,
        child: FadeInImage(
            placeholder:
                AssetImage('../assets/terror-screen/horror.jpg'),
            image: NetworkImage(libro.img),
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
