// To parse this JSON data, do
//
//     final ordenesModel = ordenesModelFromJson(jsonString);

import 'dart:convert';

Map<String, OrdenesModel> ordenesModelFromJson(String str) =>
    Map.from(json.decode(str)).map(
        (k, v) => MapEntry<String, OrdenesModel>(k, OrdenesModel.fromJson(v)));

String ordenesModelToJson(Map<String, OrdenesModel> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

String ordenesModel2ToJson(OrdenesModel data) => json.encode(data.toJson());

class OrdenesModel {
  OrdenesModel({this.cantidad, this.estado, this.total, this.id_base});

  int cantidad;
  String estado;
  int total;
  String id_base;

  OrdenesModel copyWith(
          {int cantidad, String estado, int total, String id_base}) =>
      OrdenesModel(
          cantidad: cantidad ?? this.cantidad,
          estado: estado ?? this.estado,
          total: total ?? this.total,
          id_base: id_base ?? this.id_base);

  factory OrdenesModel.fromJson(Map<String, dynamic> json) => OrdenesModel(
        cantidad: json["cantidad"],
        estado: json["estado"],
        total: json["total"],
        id_base: json["id_base"],
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "estado": estado,
        "total": total,
        "id_base": id_base,
      };
}
