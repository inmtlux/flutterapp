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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('PRINCIPAL')),
      ),
      drawer: MenuLateral(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(//LIBROS
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
    );
  }

  //LIBROS
  List<Widget> buildBooks(libros){
    List<Widget> list = [];
    for (var i = 0; i < libros.length; i++){
      list.add(buildBook(libros[i],i));
    }
    return list;
  }

  Widget buildBook(Libro book, int index){
    return Container(
      margin: EdgeInsets.only(right: 32,left:  0,bottom: 8),
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
                  offset: Offset(0,3),
                )
              ],
            ),
            margin: EdgeInsets.only(bottom: 16, top: 24),
            child: Hero(
              tag: book.descripcion,
              child: Container(
                child: ClipRRect(
                  
                  child: Image.network(
                     book.img,
                     fit: BoxFit.cover,
                 ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(15)
              ),
                // image: DecorationImage(
                //   image:NetworkImage(book.img),
                //   fit: BoxFit.cover,
                // )
              ),
              ),
            ),
          ),
          Text(
            book.descripcion,
            
          //  textDirection: TextDirection.ltr,
            style: GoogleFonts.catamaran(
              fontSize:18,
              fontWeight: FontWeight.bold,
              color: Colors.black, 
            ),
            
          ),

        ],
      ),
    );
}
}