part of 'pedido_bloc.dart';

@immutable
abstract class PedidoEvent {}

class ActivarPedido extends PedidoEvent {
  final PedidoModel pedido;
  ActivarPedido(this.pedido);
}

class CrearPedido extends PedidoEvent {
  final PedidoModel pedido;
  CrearPedido(this.pedido);
}

class CargarPedidos extends PedidoEvent {}

class EditPedido extends PedidoEvent {
  final PedidoModel pedido;
  EditPedido(this.pedido);
}
