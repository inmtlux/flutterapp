import 'dart:convert';

import 'package:primera_prueba/models/usuario.dart';

class UsuarioResponse {
    UsuarioResponse({
        required this.usuario,
    });

    List<Usuario> usuario;

    factory UsuarioResponse.fromJson(String str) => UsuarioResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioResponse.fromMap(Map<String, dynamic> json) => UsuarioResponse(
        usuario: List<Usuario>.from(json["usuario"].map((x) => Usuario.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "usuario": List<dynamic>.from(usuario.map((x) => x.toMap())),
    };
}