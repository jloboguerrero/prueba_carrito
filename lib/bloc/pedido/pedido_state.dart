part of 'pedido_bloc.dart';

class PedidoState {
  final bool existePedido;
  final PedidoModel pedido;
  final List<PedidoModel> pedidos;

  PedidoState({PedidoModel ped, List<PedidoModel> pedidos})
      : pedido = ped,
        pedidos = pedidos,
        existePedido = (pedidos != null) ? true : false;

  PedidoState copyWith({PedidoModel pedido, List<PedidoModel> pedidos}) =>
      PedidoState(ped: pedido ?? this.pedido, pedidos: pedidos ?? this.pedidos);

  PedidoState estadoInicial() => PedidoState();
}
