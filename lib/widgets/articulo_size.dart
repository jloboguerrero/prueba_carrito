import 'package:carritocompras/bloc/producto/producto_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticuloSizePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'lista');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: SafeArea(
            child: Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(
              color: Color(0xff91CF50),
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            children: <Widget>[_ArticuloConSombra()],
          ),
        )),
      ),
    );
  }
}

class _ArticuloConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductoBloc, ProductoState>(
      builder: (context, state) {
        if (state.existeProducto) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Container(
                width: 350,
                height: 320,
                child: Image.network(
                  '${state.producto.fotourl}',
                  fit: BoxFit.contain,
                ),
              ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
