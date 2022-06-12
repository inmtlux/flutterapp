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
        required this.img,
        required this.categoria,
    });

    String id;
    int usuarioId;
    String nombre;
    String email;
    String password;
    bool estado;
    String rol;
    String img;
    String categoria;

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        usuarioId: json["usuarioId"],
        nombre: json["nombre"],
        email: json["email"],
        password: json["password"],
        estado: json["estado"],
        rol: json["rol"],
        img: json["img"],
        categoria: json["categoria"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "usuarioId": usuarioId,
        "nombre": nombre,
        "email": email,
        "password": password,
        "estado": estado,
        "rol": rol,
        "img": img,
        "categoria": categoria,
    };
}