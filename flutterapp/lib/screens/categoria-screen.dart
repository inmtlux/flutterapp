import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:primera_prueba/screens/cat-terror.dart';

class CategoriaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoriasScreen();
}

class _CategoriasScreen extends State<CategoriaScreen> {
  List<List> masvisitadas = [
    ["", "../assets/categoria-screen/romance.jpg"],
    ["", "../assets/categoria-screen/terror.jpg"],
  ];

  List<List> masvisitadas2 = [
    ["", "../assets/categoria-screen/ficcion.jpg"],
    ["", "../assets/categoria-screen/literatura.jpg"],
  ];

  List<List> masvisitadas3 = [
    ["", "../assets/categoria-screen/fantasia2.jpg"],
    ["", "../assets/categoria-screen/viajes.jpg"],
  ];

  List<List> mascatgs = [
    ["", "../assets/categoria-screen/comics.jpg"],
    ["", "../assets/categoria-screen/historia.jpg"],
  ];

  List<List> mascatgs2 = [
    ["", "../assets/categoria-screen/cientifico.jpg"],
    ["", "../assets/categoria-screen/biografia.jpg"],
  ];

  List<List> mascatgs3 = [
    ["", "../assets/categoria-screen/poetico.jpg"],
    ["", "../assets/categoria-screen/infantilesYjuvenil.jpg"],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('CATEGORIAS MAS VISITADAS',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850])),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              // 1ERA PARTE DE CATEG MAS VISITADAS
              height: 174,
              width: 500,
              child: ListView.builder(
                  itemCount: masvisitadas.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final libro = masvisitadas[index];
                    return Container(
                      height: 130,
                      width: 220,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            libro[1],
                            height: 130,
                            width: 220,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            child: ElevatedButton(
                              child: const Text("CatTerror"),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "cat-terror");
                              },
                            ),
                          )
                          /*Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              libro[0],
                              style: TextStyle(fontSize: 10),
                            ),
                          )*/
                        ],
                      ),
                    );
                  })),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              // 2DA PARTE DE CATG MAS VISITADAS
              height: 146,
              width: 500,
              child: ListView.builder(
                  itemCount: masvisitadas2.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final libro = masvisitadas2[index];
                    return Container(
                      height: 130,
                      width: 220,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            libro[1],
                            height: 130,
                            width: 220,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  })),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              // 3ERA PARTE DE CATG MAS VISITADAS
              height: 170,
              width: 500,
              child: ListView.builder(
                  itemCount: masvisitadas3.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final libro = masvisitadas3[index];
                    return Container(
                      height: 130,
                      width: 220,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            libro[1],
                            height: 130,
                            width: 220,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  })),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('MAS CATEGORIAS....',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850])),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              // 1ERA PARTE DE MAS CATEGORIAS
              height: 150,
              width: 500,
              child: ListView.builder(
                  itemCount: mascatgs.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final libro = mascatgs[index];
                    return Container(
                      height: 130,
                      width: 220,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            libro[1],
                            height: 130,
                            width: 220,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  })),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              //  2DA PARTE DE MAS CATEGORIAS
              height: 146,
              width: 500,
              child: ListView.builder(
                  itemCount: mascatgs2.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final libro = mascatgs2[index];
                    return Container(
                      height: 130,
                      width: 220,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            libro[1],
                            height: 130,
                            width: 220,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  })),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              //  3ERA PARTE DE MAS CATEGORIAS
              height: 146,
              width: 500,
              child: ListView.builder(
                  itemCount: mascatgs3.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final libro = mascatgs3[index];
                    return Container(
                      height: 130,
                      width: 220,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            libro[1],
                            height: 130,
                            width: 220,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  })),
        ]),
      ),
    );
  }
}

  
    // TODO: implement build
    /*return   Center(
          child: Container(
            child: Text('categorias', style: TextStyle(fontSize: 20.0),),
          ),
      );
}}*/