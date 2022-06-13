import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primera_prueba/models/usuario_activo.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UsuarioActivoReporte extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UsuarioActivoReporte();
}

class _UsuarioActivoReporte extends State<UsuarioActivoReporte> {
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<UsuarioActivo> listaUsuariosActivos =
        usuarioProvider.listaUsuariosActivos;

    List<charts.Series<UsuarioActivo, String>> serie = [
      charts.Series(
          id: 'UsuarioActivo',
          data: listaUsuariosActivos,
          domainFn: (UsuarioActivo serie, _) => serie.id,
          measureFn: (UsuarioActivo serie, _) => serie.count,
          colorFn: (UsuarioActivo serie, _) =>
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 131, 33, 148)))
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Usuarios Activos'), backgroundColor: Color.fromARGB(255, 56, 15, 63),),
      drawer: MenuLateral(),
      body: Center(
        child: Container(
          height: 500,
          padding: EdgeInsets.all(20),
          child: Card(
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                Text('REPORTE DE USUARIOS ACTIVOS'),
                Expanded(
                    child: charts.BarChart(
                  serie,
                  
                  animate: true,
                ))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
