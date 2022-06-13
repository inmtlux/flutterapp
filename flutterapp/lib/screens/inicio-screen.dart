import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/providers/libro_provider.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

class InicioScrenn extends StatefulWidget {
  @override
  State<InicioScrenn> createState() => _InicioScrenn();
}

class _InicioScrenn extends State<InicioScrenn> {
  @override
  Widget build(BuildContext context) {
    final libroProvider = Provider.of<LibroProvider>(context);
    final List<Libro> listaNovedades = libroProvider.listaLibrosNovedades;
    final List<Libro> listaPopulares = libroProvider.listaLibrosPopulares;
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: 160,
                backgroundColor: Color.fromARGB(255, 32, 32, 32),
                iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'INICIO',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  background: ShaderMask(
                    shaderCallback: (rect) => LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Color.fromARGB(255, 29, 29, 29), Color.fromARGB(255, 41, 76, 233)],
                    ).createShader(rect),
                    blendMode: BlendMode.darken,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/libros.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
               child: Container(
                
         padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 55),
         child: Column(//LIBROS
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text('Novedades', style: TextStyle(fontSize: 30),),
             Expanded(
               child: Container(
                 child: ListView(
                   physics: BouncingScrollPhysics(),
                   scrollDirection: Axis.horizontal,
                   children: buildBooks(listaNovedades),
                 ),
               ),
             ),
             Text('Populares', style: TextStyle(fontSize: 30),),
             Expanded(
             child: Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: buildBooks(listaPopulares),
                  ),
              ),
              ),

           ],
         ),
       ),
              )
            ],
          ),
           drawer: MenuLateral(),
        )
      ],
    );

  }

  //LIBROS
  List<Widget> buildBooks(libros) {
    List<Widget> list = [];
    for (var i = 0; i < libros.length; i++) {
      list.add(buildBook(libros[i], i));
    }
    return list;
  }

  Widget buildBook(Libro book, int index) {
    return Container(
      margin: EdgeInsets.only(right: 32, left: 0, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 12,
                  offset: Offset(0, 3),
                )
              ],
            ),
            margin: EdgeInsets.only(bottom: 16, top: 24),
            child: Hero(
              tag: book.descripcion,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    book.img,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(15)),
                //     image: DecorationImage(
                //       image: NetworkImage(book.img),
                //       fit: BoxFit.cover,
                //     )),
              ),
            ),
          ),
          Text(
            book.descripcion,

            //  textDirection: TextDirection.ltr,
            style: GoogleFonts.catamaran(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
