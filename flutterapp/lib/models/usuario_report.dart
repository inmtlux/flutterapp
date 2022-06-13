import 'dart:convert';

class ReporteUsuario {
    ReporteUsuario({
        required this.id,
        required this.count,
    });

    String id;
    int count;

    factory ReporteUsuario.fromJson(String str) => ReporteUsuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ReporteUsuario.fromMap(Map<String, dynamic> json) => ReporteUsuario(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}
