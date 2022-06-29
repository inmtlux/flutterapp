import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:primera_prueba/models/categoria.dart';
import 'package:primera_prueba/models/categoria_report.dart';
import 'package:primera_prueba/models/categoria_report_responsive.dart';
import 'dart:io';
import '../models/categoria_response.dart';

class CategoriaProvider extends ChangeNotifier {
  String _baseUrl = "senku-apirest.herokuapp.com";

  List<Categoria> listaCategorias = [];
  List<ReporteCategoria> listaReporteCategoria = [];

  CategoriaProvider() {
    print("Ingresando a CategoriaProvider");
    this.getOnCategoriaList();
    this.reporteCategoria();
  }

  getOnCategoriaList() async {
    var url = Uri.http(_baseUrl, "/api/categorias", {});
    final response = await http.get(url);
    print(response.body);
    final categoriaResponse = CategoriaResponse.fromJson(response.body);
    listaCategorias = categoriaResponse.categorias;
    notifyListeners();
  }

  saveCategoria(Categoria categorias) async {
    var url = Uri.http(_baseUrl, '/api/categorias/save');
    print(categorias.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: categorias.toJson());
    print(response.body);
    getOnCategoriaList();
    notifyListeners();
  }

  reporteCategoria() async {
    var url = Uri.http(_baseUrl, 'api/reportes/ReporteCategorias');
    final response = await http.get(url);
    final categoriaReportResponse =
        CategoriaReportResponse.fromJson(response.body);
    listaReporteCategoria = categoriaReportResponse.reporteCategorias;
    notifyListeners();
  }
}
