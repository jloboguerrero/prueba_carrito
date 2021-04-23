part of 'ordenes_bloc.dart';

@immutable
abstract class OrdenesEvent {}

class CrearOrden extends OrdenesEvent {
  final OrdenesModel orden;
  CrearOrden(this.orden);
}

class CargarOrdenes extends OrdenesEvent {}

class CompletedOrden extends OrdenesEvent {
  final OrdenesModel orden;
  CompletedOrden(this.orden);
}

class BorrarOrden extends OrdenesEvent {
  final OrdenesModel orden;
  BorrarOrden(this.orden);
}
