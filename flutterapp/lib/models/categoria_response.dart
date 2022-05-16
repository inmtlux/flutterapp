import 'dart:convert';

import 'package:primera_prueba/models/categoria.dart';

class CategoriaResponse {
  CategoriaResponse({
    required this.productos,
  });

  List<Producto> productos;

  factory CategoriaResponse.fromJson(String str) =>
      CategoriaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriaResponse.fromMap(Map<String, dynamic> json) =>
      CategoriaResponse(
        productos: List<Producto>.from(
            json["productos"].map((x) => Producto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
      };
}
