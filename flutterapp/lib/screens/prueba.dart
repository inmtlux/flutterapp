
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
    final List<Libro> listaTerPo = libroProvider.listaLibrosTerrPo;
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.black,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
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
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Novedades',
                        style: TextStyle(fontSize: 30,color: Colors.white),
                      ),
                      Container(
                        height: 170,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: listaTerPo.length,
                          separatorBuilder: (context, _) => SizedBox(
                            width: 20,
                          ),
                          itemBuilder: (context, index) =>
                              buildCard(item: listaTerPo[index]),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Libros',
                        style: TextStyle(fontSize: 30,color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 400,
                        child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: listaTerPo.length,
                        separatorBuilder: (context, _) => SizedBox(
                        width: 20,
                        ),
                        itemBuilder: (context, index) =>
                        buildTerr (item: listaTerror[index]),
                        )
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
        ),
      ],
    );
  }
}
Widget buildCard({
  required Libro item,
}) =>
    Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 100,
              width: 100,
              //borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                 Image.network(
                  item.img,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(item.descripcion,style: TextStyle(fontSize: 15,color: Colors.white),)
        ],
      ),
    );

Widget buildTerr({
  required Libro item,
}) =>
    Card(
      child: Container(
              
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(232, 14, 4, 4),
                    Color.fromARGB(255, 243, 2, 2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(3)
              ),
               child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 70,
                        child: Image.network(item.img,fit: BoxFit.cover),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(item.descripcion,style: TextStyle(fontSize: 15,color: Colors.white),),
                           SizedBox(height: 10,),
                           Text(item.autor,style: TextStyle(fontSize: 15,color: Colors.white),),
                         ],
                       )
                    ],
                  )
                ],
              ),
            ),
);

       