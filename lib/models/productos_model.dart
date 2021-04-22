// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

Map<String, ProductoModel> productoModelFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, ProductoModel>(k, ProductoModel.fromJson(v)));

String productoModelToJson(Map<String, ProductoModel> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class ProductoModel {
  ProductoModel(
      {this.descripcion,
      this.disponible,
      this.fotourl,
      this.id,
      this.nombre,
      this.precio});

  String descripcion;
  bool disponible;
  String fotourl;
  int id;
  String nombre;
  int precio;

  ProductoModel copyWith({
    String descripcion,
    bool disponible,
    String fotourl,
    int id,
    String nombre,
    int precio,
  }) =>
      ProductoModel(
          descripcion: descripcion ?? this.descripcion,
          disponible: disponible ?? this.disponible,
          fotourl: fotourl ?? this.fotourl,
          id: id ?? this.id,
          nombre: nombre ?? this.nombre,
          precio: precio ?? this.precio);

  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        descripcion: json["descripcion"],
        disponible: json["disponible"],
        fotourl: json["fotourl"],
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "disponible": disponible,
        "fotourl": fotourl,
        "id": id,
        "nombre": nombre,
        "precio": precio,
      };
}
