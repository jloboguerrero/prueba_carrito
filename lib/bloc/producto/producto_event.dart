part of 'producto_bloc.dart';

@immutable
abstract class ProductoEvent {}

class ActivarProducto extends ProductoEvent {
  final ProductoModel producto;
  ActivarProducto(this.producto);
}

class CargarProductos extends ProductoEvent {}

class AbreProducto extends ProductoEvent {
  final ProductoModel producto;
  AbreProducto(this.producto);
}
