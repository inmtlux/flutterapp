import 'package:flutter/material.dart';
import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/providers/libro_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/menu_lateral.dart';

class Terror1Screen extends StatefulWidget {
  @override
  createState() => _Terror1Screen();
}

class _Terror1Screen extends State<Terror1Screen> {
  @override
  Widget build(BuildContext context) {
    final libroProvider = Provider.of<LibroProvider>(context);
    final List<Libro> listaLibros = libroProvider.listaLibros;

    return Scaffold(
      appBar: AppBar(
        title: Text('Autores'),
      ),
      body: Center(
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
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'libro_form_screen');
        },
        backgroundColor: Colors.blue,
      ),
      drawer: MenuLateral(),
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
                AssetImage('../assets/terror-screen/horror.jpg'),
            image: AssetImage('../assets/terror-screen/horror.jpg'),

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
