import 'dart:convert';

import 'producto.dart';

class ProductoResponse {
  ProductoResponse({
    required this.productos,
  });

  List<Producto> productos;

  factory ProductoResponse.fromJson(String str) =>
      ProductoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductoResponse.fromMap(Map<String, dynamic> json) =>
      ProductoResponse(
        productos: List<Producto>.from(
            json["productos"].map((x) => Producto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
      };
}
