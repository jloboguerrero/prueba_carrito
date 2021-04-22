part of 'ordenes_bloc.dart';

class OrdenesState {
  final bool existeOrden;
  final OrdenesModel orden;
  final List<OrdenesModel> ordenes;

  OrdenesState({OrdenesModel ord, List<OrdenesModel> ordenes})
      : orden = ord,
        ordenes = ordenes,
        existeOrden = (ordenes != null) ? true : false;

  OrdenesState copyWith({OrdenesModel orden, List<OrdenesModel> ordenes}) =>
      OrdenesState(ord: orden ?? this.orden, ordenes: ordenes ?? this.ordenes);

  OrdenesState estadoInicial() => OrdenesState();
}
