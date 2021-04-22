part of 'producto_bloc.dart';

/* @immutable
abstract class ProductoState {}

class ProductoInitial extends ProductoState {} */

class ProductoState {
  final bool existeProducto;
  final ProductoModel producto;
  final List<ProductoModel> productos;

  ProductoState({ProductoModel prod, List<ProductoModel> productoss})
      : producto = prod,
        productos = (productoss != []) ? productoss : [],
        existeProducto = (productoss != null) ? true : false;

  ProductoState copyWith(
          {ProductoModel producto, List<ProductoModel> productos}) =>
      ProductoState(
          prod: producto ?? this.producto,
          productoss: productos ?? this.productos);

  ProductoState estadoInicial() => ProductoState();
}
