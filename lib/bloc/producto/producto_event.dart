part of 'producto_bloc.dart';

@immutable
abstract class ProductoEvent {}

class ActivarProducto extends ProductoEvent {
  final ProductoModel producto;
  ActivarProducto(this.producto);
}

class CargarProductos extends ProductoEvent {}

class AbreProducto extends ProductoEvent {
  //final String fotourl;
  final ProductoModel producto;
  //AbreProducto(this.fotourl, this.producto);
  AbreProducto(this.producto);
}
