import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';

class ReporteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReporteScreen();
}

class _ReporteScreen extends State<ReporteScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: (AppBar(
        title: Text('REPORTES'),
      )),
      drawer: MenuLateral(),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Reporte usuario'),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, 'reporte_usuarios');
                  },
                  tileColor: Colors.blue,
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: Text('Reporte libros'),
                  onTap: () {},
                  tileColor: Colors.blue,
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: Text('Reporte Categorias'),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, 'reporte_categorias_screen');
                  },
                  tileColor: Colors.blue,
                )
              ],
            ),
          )),
    );
  }
}
