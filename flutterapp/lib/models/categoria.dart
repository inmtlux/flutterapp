import 'dart:convert';

class Categoria {
  Categoria({
    required this.id,
    required this.descripcion,
    required this.cantidadlibros,
    required this.categoriaId,
  });

  String id;
  String descripcion;
  String cantidadlibros;
  int categoriaId;

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        descripcion: json["descripcion"],
        cantidadlibros: json["cantidadlibros"],
        categoriaId: json["categoriaId"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "descripcion": descripcion,
        "cantidadlibros": cantidadlibros,
        "categoriaId": categoriaId,
      };
}
