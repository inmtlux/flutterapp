import 'dart:convert';


class UsuarioActivo {
    UsuarioActivo({
        required this.id,
        required this.count,
    });

    String id;
    int count;

    factory UsuarioActivo.fromJson(String str) => UsuarioActivo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioActivo.fromMap(Map<String, dynamic> json) => UsuarioActivo(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}
