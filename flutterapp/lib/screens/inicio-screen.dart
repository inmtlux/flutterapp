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
                backgroundColor: Color.fromARGB(255, 41, 76, 233),
                iconTheme:
                    IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
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
                      colors: [
                        Color.fromARGB(255, 29, 29, 29),
                        Color.fromARGB(255, 41, 76, 233)
                      ],
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
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Novedades',
                        style: TextStyle(fontSize: 30),
                      ),
                      Container(
                        height: 250,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: listaNovedades.length,
                          separatorBuilder: (context, _) => SizedBox(
                            width: 20,
                          ),
                          itemBuilder: (context, index) => _CardLibro(listaNovedades[index]),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'POPULARES',
                        style: TextStyle(fontSize: 30),
                      ),
                      Container(
                        height: 250,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: listaPopulares.length,
                            separatorBuilder: (context, _) => SizedBox(
                                  width: 20,
                                ),
                            itemBuilder: (context, index) => _CardLibro(listaPopulares[index])
                            ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ])),
            ],
          ),
          drawer: MenuLateral(),
        )
      ],
    );
  }
}



class _CardLibro extends StatelessWidget {
  final Libro libro;
  _CardLibro(this.libro);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                libro.img,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  libro.descripcion,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.black87,
                  onPressed: () {
                    Navigator.pushNamed(context,'libro_form_update',
                arguments: libro);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
