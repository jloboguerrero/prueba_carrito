part of 'ordenes_bloc.dart';

@immutable
abstract class OrdenesEvent {}

class CrearOrden extends OrdenesEvent {
  final OrdenesModel orden;
  CrearOrden(this.orden);
}

class CargarOrdenes extends OrdenesEvent {}
