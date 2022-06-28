import 'dart:convert';

import 'package:primera_prueba/models/usuario_activo.dart';

class UsuarioActivoResponse {
    UsuarioActivoResponse({
        required this.usuarioActivo,
    });

    List<UsuarioActivo> usuarioActivo;

    factory UsuarioActivoResponse.fromJson(String str) => UsuarioActivoResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioActivoResponse.fromMap(Map<String, dynamic> json) => UsuarioActivoResponse(
        usuarioActivo: List<UsuarioActivo>.from(json["usuarioActivo"].map((x) => UsuarioActivo.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "usuarioActivo": List<dynamic>.from(usuarioActivo.map((x) => x.toMap())),
    };
}