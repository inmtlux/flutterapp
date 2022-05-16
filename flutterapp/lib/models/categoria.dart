import 'dart:convert';

class Producto {
  Producto({
    required this.id,
    required this.productoId,
    required this.descripcion,
    required this.cantidadlibros,
  });

  String id;
  int productoId;
  String descripcion;
  String cantidadlibros;

  factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        id: json["_id"],
        productoId: json["productoId"],
        descripcion: json["descripcion"],
        cantidadlibros: json["cantidadlibros"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "productoId": productoId,
        "descripcion": descripcion,
        "cantidadlibros": cantidadlibros,
      };
}
