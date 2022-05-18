import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import '../models/producto.dart';
import '../models/producto_response.dart';
import "package:http/http.dart" as http;


class ProductoProvider extends ChangeNotifier {
  String _baseUrl = "localhost:8080";

  List<Producto> listaProductos = [];

  ProductoProvider() {
    print("Ingresando a ProductoProvider");
    this.getOnProductoList();
  }

  getOnProductoList() async {
    var url = Uri.http(_baseUrl, "/api/productos", {});
    final response = await http.get(url);
    print(response.body);
    final productoResponse = ProductoResponse.fromJson(response.body);
    listaProductos = productoResponse.productos;
    notifyListeners();
  }

  saveProducto(Producto producto) async {
    var url = Uri.http(_baseUrl, "/api/productos/save");
    print(producto.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: producto.toJson());
    print(response.body);
    getOnProductoList();
    notifyListeners();
  }
}
