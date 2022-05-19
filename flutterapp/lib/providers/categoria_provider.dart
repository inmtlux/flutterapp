import 'package:flutter/material.dart';
import 'package:primera_prueba/models/categoria.dart';
import "package:http/http.dart" as http;
import 'dart:io';
import '../models/categoria_response.dart';

class CategoriaProvider extends ChangeNotifier {
  String _baseUrl = "192.168.42.51:3999";

  List<Producto> listaCategorias = [];

  CategoriaProvider() {
    print("Ingresando a CategoriaProvider");
    this.getOnCategoriaList();
  }

  getOnCategoriaList() async {
    var url = Uri.http(_baseUrl, "/api/categorias", {});
    final response = await http.get(url);
    print(response.body);
    final categoriaResponse = CategoriaResponse.fromJson(response.body);
    listaCategorias = categoriaResponse.productos;
    notifyListeners();
  }
}
