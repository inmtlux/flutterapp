import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';

class InicioScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoriaScreen();
}

class _CategoriaScreen extends State<InicioScreen> {
  List<List> novedades = [
    ["Cortejo", "../assets/inicio-screen/cortejo.jpg"],
    ["Abril rojo", "../assets/inicio-screen/abril-rojo.jpg"],
    ["Boulevard", "../assets/inicio-screen/boulevard.jpg"],
    ["Cortejo", "../assets/inicio-screen/mapa-anhelos.jpg"],
    ["Violeta", "../assets/inicio-screen/violeta.jpg"],
  ];

  List<List> populares = [
    ["IT", "../assets/inicio-screen/it.jpg"],
    ["el-principito", "../assets/inicio-screen/el-principito.jpg"],
    ["After 1", "../assets/inicio-screen/after.jpg"],
    ["Hush Hush", "../assets/inicio-screen/hush.jpg"],
    ["Steve Jobs", "../assets/inicio-screen/steve-jobs.jpg"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text('Principal'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Novedade',
                  style: TextStyle(fontSize: 25, color: Colors.grey[850], fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: novedades.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final libro = novedades[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        height: 180,
                        width: 100,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.amber,
                              child: Image.asset(
                                libro[1],
                                height: 150,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                libro[0],
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Mas Populares',
                  style: TextStyle(fontSize: 25, color: Colors.grey[850], fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
                height: 230,
                child: ListView.builder(
                    itemCount: populares.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final libro = populares[index];
                      return Container(
                        height: 220,
                        width: 100,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              libro[1],
                              height: 150,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                libro[0],
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
          ]),
        ),
      ),
    );
  }
}
