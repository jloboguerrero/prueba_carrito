// To parse this JSON data, do
//
//     final pedidoModel = pedidoModelFromJson(jsonString);

import 'dart:convert';

Map<String, PedidoModel> pedidoModelFromJson(String str) =>
    Map.from(json.decode(str)).map(
        (k, v) => MapEntry<String, PedidoModel>(k, PedidoModel.fromJson(v)));

String pedidoModelToJson(Map<String, PedidoModel> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

String pedidoModel2ToJson(PedidoModel data) => json.encode(data.toJson());

class PedidoModel {
  PedidoModel(
      {this.cantidad,
      this.id,
      this.idCarrito,
      this.nombre,
      this.precio,
      this.fotourl,
      this.id_base});

  int cantidad;
  int id;
  int idCarrito;
  String nombre;
  int precio;
  String fotourl;
  String id_base;

  factory PedidoModel.fromJson(Map<String, dynamic> json) => PedidoModel(
        cantidad: json["cantidad"],
        id: json["id"],
        idCarrito: json["id_carrito"],
        nombre: json["nombre"],
        precio: json["precio"],
        fotourl: json["fotourl"],
        id_base: json["id_base"],
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "id": id,
        "id_carrito": idCarrito,
        "nombre": nombre,
        "precio": precio,
        "fotourl": fotourl,
        "id_base": id_base,
      };
}
