import 'package:flutter/material.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primera_prueba/models/libro.dart';
import 'package:primera_prueba/providers/libro_provider.dart';
import 'package:provider/provider.dart';

class PruebaScreen extends StatefulWidget {
  PruebaScreen({Key? key}) : super(key: key);

  @override
  State<PruebaScreen> createState() => _PruebaScreenState();
}

class _PruebaScreenState extends State<PruebaScreen> {
  

  @override
  Widget build(BuildContext context) {
    final libroProvider = Provider.of<LibroProvider>(context);
    final List<Libro> listaTerror = libroProvider.listaLibrosTerror;
    return Stack(
      children: <Widget>[
        Scaffold(
          //drawer: TerrorScreen(),
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                /*leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
      onPressed: (){
        Navigator.pushReplacementNamed(context, 'Crear nueva cuenta');
      },),*/
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: 160,
                backgroundColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'HORROR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  background: ShaderMask(
                    shaderCallback: (rect) => LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(rect),
                    blendMode: BlendMode.darken,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/oscuro.jpg'),
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
                   children: buildBooks(listaTerror),
                 ),
               ),
             ),
             SizedBox(
              height: 20,
             ),
             Text('Populares', style: TextStyle(fontSize: 30),),
             Expanded(
             child: Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: buildBooks(listaTerror),
                  ),
              ),
              ),

           ],
         ),
       ),
              ),
            ],
          ),
          drawer: MenuLateral(),
        ),
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
      height: 100,
      
      
      margin: EdgeInsets.only(right: 32, left: 0, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
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
              
              tag: '',
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child:FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                    book.img,
                    height: 200,
                    ),
                  ),
                   /*Image.network(
                    book.img,
                    height: 200,
                    fit: BoxFit.cover,
                  ),*/
                ),
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