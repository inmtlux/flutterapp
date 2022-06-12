import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primera_prueba/models/categoria_report.dart';
import 'package:primera_prueba/providers/categoria_provider.dart';
import 'package:primera_prueba/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteCategoriaScreen extends StatefulWidget {
  ReporteCategoriaScreen({Key? key}) : super(key: key);
  @override
  State<ReporteCategoriaScreen> createState() => _ReporteCategoriaScreenState();
}

class _ReporteCategoriaScreenState extends State<ReporteCategoriaScreen> {
  @override
  Widget build(BuildContext context) {
    final categoriaProvider = Provider.of<CategoriaProvider>(context);
    final List<ReporteCategoria> listaReporteCategoria =
        categoriaProvider.listaReporteCategoria;

    List<charts.Series<ReporteCategoria, String>> serie = [
      charts.Series(
          id: 'ReporteCategorias',
          data: listaReporteCategoria,
          domainFn: (ReporteCategoria serie, _) => serie.id,
          measureFn: (ReporteCategoria serie, _) => serie.count,
          colorFn: (ReporteCategoria serie, _) =>
              charts.ColorUtil.fromDartColor(Colors.greenAccent))
    ];

    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: const Text('REPORTE DE CATEGORIAS')),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("REPORTE DE CATEGORIAS"),
                  Expanded(
                      child: charts.BarChart(
                    serie,
                    animate: true,
                    vertical: false, //horizontal barras
                  )),
                  Text("FUENTE: MONGODB")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
