import 'dart:convert';

import 'package:primera_prueba/models/categoria_report.dart';

class CategoriaReportResponse {
  CategoriaReportResponse({
    required this.reporteCategorias,
  });

  List<ReporteCategoria> reporteCategorias;

  factory CategoriaReportResponse.fromJson(String str) =>
      CategoriaReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriaReportResponse.fromMap(Map<String, dynamic> json) =>
      CategoriaReportResponse(
        reporteCategorias: List<ReporteCategoria>.from(
            json["ReporteCategorias"].map((x) => ReporteCategoria.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ReporteCategorias":
            List<dynamic>.from(reporteCategorias.map((x) => x.toMap())),
      };
}
