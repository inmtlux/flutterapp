import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:primera_prueba/models/categoria.dart';
import 'dart:io';
import '../models/categoria_response.dart';

class CategoriaProvider extends ChangeNotifier {
  String _baseUrl = "localhost:8080";

  List<Categoria> listaCategorias = [];

  CategoriaProvider() {
    print("Ingresando a CategoriaProvider");
    this.getOnCategoriaList();
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
}
