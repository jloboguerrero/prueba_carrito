import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:carritocompras/models/ordenes_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'ordenes_event.dart';
part 'ordenes_state.dart';

class OrdenesBloc extends Bloc<OrdenesEvent, OrdenesState> {
  OrdenesBloc() : super(OrdenesState());

  final String _url = 'https://carrito-b6dce-default-rtdb.firebaseio.com';

  Future<bool> crearOrden(OrdenesModel pedido) async {
    final url = '$_url/Ordenes.json';

    final resp = await http.post(url, body: ordenesModel2ToJson(pedido));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<OrdenesModel>> cargarOrdenes() async {
    final url = '$_url/Pedido.json';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<OrdenesModel> ordenes = List();

    if (decodedData == null) return [];

    decodedData.forEach((id_base, orders) {
      final ordesTemp = OrdenesModel.fromJson(orders);
      ordesTemp.id_base = id_base;

      ordenes.add(ordesTemp);
    });

    return ordenes;
  }

  @override
  Stream<OrdenesState> mapEventToState(OrdenesEvent event) async* {
    if (event is CrearOrden) {
      final test = await crearOrden(event.orden);
      print(test);
      yield state.copyWith(orden: event.orden);
    } else if (event is CargarOrdenes) {
      final lista = await cargarOrdenes();
      yield state.copyWith(ordenes: lista);
    }
  }
}
