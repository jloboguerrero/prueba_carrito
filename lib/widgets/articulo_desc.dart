import 'package:flutter/material.dart';

class ArticuloDescripcion extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ArticuloDescripcion({this.titulo, this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text(
            this.titulo,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            this.descripcion,
            style: TextStyle(color: Colors.black54, height: 1.5),
          ),
        ],
      ),
    );
  }
}
