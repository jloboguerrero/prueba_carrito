import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:carritocompras/models/pedido_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'pedido_event.dart';
part 'pedido_state.dart';

class PedidoBloc extends Bloc<PedidoEvent, PedidoState> {
  PedidoBloc() : super(PedidoState());

  final String _url = 'https://carrito-b6dce-default-rtdb.firebaseio.com';

  Future<bool> crearPedido(PedidoModel pedido) async {
    final url = '$_url/Pedido.json';

    final resp = await http.post(url, body: pedidoModel2ToJson(pedido));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarPedido(PedidoModel pedido) async {
    final url = '$_url/Pedido/${pedido.id_base}.json';

    final resp = await http.put(url, body: pedidoModel2ToJson(pedido));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<PedidoModel>> cargarPedidos() async {
    final url = '$_url/Pedido.json';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<PedidoModel> pedidos = List();

    if (decodedData == null) return [];

    decodedData.forEach((id_base, ped) {
      final pedTemp = PedidoModel.fromJson(ped);
      pedTemp.id_base = id_base;
      //print(id);

      pedidos.add(pedTemp);
    });

    return pedidos;
  }

  Future<int> borrarPedido(String id) async {
    final url = '$_url/Pedido/$id.json';
    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  @override
  Stream<PedidoState> mapEventToState(PedidoEvent event) async* {
    if (event is ActivarPedido) {
      yield state.copyWith(pedido: event.pedido);
    } else if (event is CrearPedido) {
      final test = await crearPedido(event.pedido);
      print(test);
      yield state.copyWith(pedido: event.pedido);
    } else if (event is CargarPedidos) {
      final lista = await cargarPedidos();
      yield state.copyWith(pedidos: lista);
    } else if (event is EditPedido) {
      final edit = await editarPedido(event.pedido);
      print(edit);
      yield state.copyWith(pedido: event.pedido);
    } else if (event is BorrarPedido) {
      await borrarPedido(event.pedido.id_base);
      yield state.copyWith(pedido: event.pedido);
    }
  }
}
