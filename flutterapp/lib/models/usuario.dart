import 'dart:convert';

class Usuario {
    Usuario({
        required this.id,
        required this.usuarioId,
        required this.nombre,
        required this.email,
        required this.password,
        required this.estado,
        required this.rol,
        this.nombApelli,
    });

    String id;
    int usuarioId;
    String nombre;
    String email;
    String password;
    bool estado;
    String rol;
    dynamic nombApelli;

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        usuarioId: json["usuarioId"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        email: json["email"],
        password: json["password"],
        estado: json["estado"],
        rol: json["rol"],
        nombApelli: json["nombApelli"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "usuarioId": usuarioId,
        "nombre": nombre == null ? null : nombre,
        "email": email,
        "password": password,
        "estado": estado,
        "rol": rol,
        "nombApelli": nombApelli,
    };
}