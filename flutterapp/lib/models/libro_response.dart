
import 'dart:convert';

import 'package:primera_prueba/models/libro.dart';

class LibroResponse {
    LibroResponse({
        required this.libro,
    });

    List<Libro> libro;

    factory LibroResponse.fromJson(String str) => LibroResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LibroResponse.fromMap(Map<String, dynamic> json) => LibroResponse(
        libro: List<Libro>.from(json["libro"].map((x) => Libro.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "libro": List<dynamic>.from(libro.map((x) => x.toMap())),
    };
}