import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:carritocompras/models/productos_model.dart';
import 'package:meta/meta.dart';

part 'producto_event.dart';
part 'producto_state.dart';

class ProductoBloc extends Bloc<ProductoEvent, ProductoState> {
  ProductoBloc() : super(ProductoState());

  final String _url = 'https://carrito-b6dce-default-rtdb.firebaseio.com';

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/Productos.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = List();

    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = ProductoModel.fromJson(prod);

      productos.add(prodTemp);
    });

    return productos;
  }

  @override
  Stream<ProductoState> mapEventToState(ProductoEvent event) async* {
    if (event is ActivarProducto) {
      yield state.copyWith(producto: event.producto);
    } else if (event is CargarProductos) {
      final lista = await cargarProductos();
      yield state.copyWith(productos: lista);
    } else if (event is AbreProducto) {
      yield state.copyWith(producto: event.producto);
    }
  }
}
