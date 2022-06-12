import 'dart:convert';

class ReporteCategoria {
  ReporteCategoria({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory ReporteCategoria.fromJson(String str) =>
      ReporteCategoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReporteCategoria.fromMap(Map<String, dynamic> json) =>
      ReporteCategoria(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
