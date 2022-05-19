import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:primera_prueba/models/producto.dart';
import 'dart:io';

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
    //final categoriaResponse = CategoriaResponse.fromJson(response.body);
    //listaCategorias = categoriaResponse.productos;
    notifyListeners();
  }
}
