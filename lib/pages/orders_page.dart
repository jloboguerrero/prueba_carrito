import 'package:carritocompras/bloc/ordenes/ordenes_bloc.dart';
import 'package:carritocompras/helpers/alerta.dart';
import 'package:carritocompras/models/ordenes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordenesBloc = BlocProvider.of<OrdenesBloc>(context);
    ordenesBloc.add(CargarOrdenes());

    return Scaffold(
        appBar: AppBar(
          title: Text('Orders', style: TextStyle(fontSize: 24.0)),
          centerTitle: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Color(0xff91CF50),
                  Color(0xff034D53),
                ])),
          ),
          elevation: 0.0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.15,
          leading: IconButton(
            padding: EdgeInsets.only(left: 10),
            splashColor: Colors.transparent,
            splashRadius: 0.5,
            icon: Icon(
              Icons.arrow_back,
              size: 24,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'lista');
            },
          ),
        ),
        body: Container(
          width: double.infinity,
          height: (MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height * 0.14) /
              1.25,
          child: BlocBuilder<OrdenesBloc, OrdenesState>(
            builder: (context, state) {
              if (state.existeOrden) {
                return ListView.builder(
                  itemCount: state.ordenes.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, i) {
                    return Card(
                      elevation: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Id: ${state.ordenes[i].id_base}',
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Quantity: ${state.ordenes[i].cantidad}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Total: \$${state.ordenes[i].total}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'State: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${state.ordenes[i].estado}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        (state.ordenes[i].estado == 'Completed')
                                            ? Colors.green
                                            : Colors.yellow),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 5),
                              IconButton(
                                  icon: Icon(Icons.assignment_turned_in,
                                      color: (state.ordenes[i].estado ==
                                              'Completed')
                                          ? Colors.green
                                          : Colors.black),
                                  onPressed: () {
                                    if (state.ordenes[i].estado !=
                                        'Completed') {
                                      final completed = OrdenesModel(
                                          cantidad: state.ordenes[i].cantidad,
                                          estado: 'Completed',
                                          total: state.ordenes[i].total,
                                          id_base: state.ordenes[i].id_base);
                                      ordenesBloc
                                          .add(CompletedOrden(completed));

                                      Navigator.pushNamed(context, 'orders');
                                    }
                                  }),
                              SizedBox(height: 5),
                              IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    mostrarAlerta(context, 'Borrar Orden',
                                        'Al dar ok se borrará la orden, ¿Seguro?',
                                        () {
                                      ordenesBloc
                                          .add(BorrarOrden(state.ordenes[i]));

                                      Navigator.pushNamed(context, 'lista');
                                    });
                                  }),
                              SizedBox(height: 5),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  width: double.infinity,
                  height: 600,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      'Aún no hay ninguna orden.',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }
}
