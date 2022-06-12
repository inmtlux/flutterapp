import 'dart:convert';

import 'package:primera_prueba/models/usuario_report.dart';

class UsuarioReportResponse {
    UsuarioReportResponse({
        required this.reporteUsuarios,
    });

    List<ReporteUsuario> reporteUsuarios;

    factory UsuarioReportResponse.fromJson(String str) => UsuarioReportResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioReportResponse.fromMap(Map<String, dynamic> json) => UsuarioReportResponse(
        reporteUsuarios: List<ReporteUsuario>.from(json["ReporteUsuarios"].map((x) => ReporteUsuario.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "ReporteUsuarios": List<dynamic>.from(reporteUsuarios.map((x) => x.toMap())),
    };
}