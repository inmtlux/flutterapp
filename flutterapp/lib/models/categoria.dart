import 'dart:convert';

class Categoria {
  Categoria({
    required this.id,
    required this.categoriaId,
    required this.descripcion,
    required this.cantidadlibros,
    required this.img,
    required this.categoria,
    required this.estado,
  });

  String id;
  int categoriaId;
  String descripcion;
  dynamic cantidadlibros;
  String img;
  String categoria;
  String estado;

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        categoriaId: json["categoriaId"],
        descripcion: json["descripcion"],
        cantidadlibros: json["cantidadlibros"],
        img: json["imagen"],
        categoria: json["categoria"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "categoriaId": categoriaId,
        "descripcion": descripcion,
        "cantidadlibros": cantidadlibros,
        "img": img,
        "categoria": categoria,
        "estado": estado,
      };
}
