import 'package:flutter/material.dart';
import 'package:primera_prueba/models/usuario_report.dart';
import 'package:primera_prueba/providers/usuario_provider.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UsuarioReporte extends StatefulWidget {
  UsuarioReporte({Key? key}) : super(key: key);

  @override
  State<UsuarioReporte> createState() => _UsuarioReporteState();
}

class _UsuarioReporteState extends State<UsuarioReporte> {
  @override
  Widget build(BuildContext context) {

    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<ReporteUsuario> listaUsuarioReport = usuarioProvider.listaUsuarioReport;

    List<charts.Series<ReporteUsuario, String>> serie =[
      charts.Series(
        id: 'ReporteUsuario',
        data: listaUsuarioReport,
        domainFn: (ReporteUsuario serie,_)=> serie.id,
        measureFn: (ReporteUsuario serie,_)=> serie.count,
        colorFn: (ReporteUsuario serie,_)=> charts.ColorUtil.fromDartColor(Colors.amber)
      )
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Usuarios'),),
      drawer: MenuLateral(),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text('Reporte de Usuarios'),
                Expanded(child: charts.BarChart(serie,animate: true,))
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }
}