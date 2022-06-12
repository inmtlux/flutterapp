import 'dart:convert';

class Libro {
    Libro({
        required this.id,
        required this.libroId,
        required this.categoria,
        required this.descripcion,
        required this.autor,
        required this.img,
    });

    String id;
    int libroId;
    String categoria;
    String descripcion;
    String autor;
    String img;

    factory Libro.fromJson(String str) => Libro.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Libro.fromMap(Map<String, dynamic> json) => Libro(
        id: json["_id"],
        libroId: json["libroId"],
        categoria: json["categoria"],
        descripcion: json["descripcion"],
        autor: json["autor"],
        img: json["img"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "libroId": libroId,
        "categoria": categoria,
        "descripcion": descripcion,
        "autor": autor,
        "img": img,
    };
}
