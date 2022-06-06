import 'dart:convert';
import 'package:primera_prueba/models/categoria.dart';

class CategoriaResponse {
  CategoriaResponse({
    required this.categorias,
  });

  List<Categoria> categorias;

  factory CategoriaResponse.fromJson(String str) =>
      CategoriaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriaResponse.fromMap(Map<String, dynamic> json) =>
      CategoriaResponse(
        categorias: List<Categoria>.from(
            json["categorias"].map((x) => Categoria.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "categorias": List<dynamic>.from(categorias.map((x) => x.toMap())),
      };
}
