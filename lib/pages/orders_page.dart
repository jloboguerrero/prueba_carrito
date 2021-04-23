import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:carritocompras/bloc/ordenes/ordenes_bloc.dart';
import 'package:carritocompras/helpers/alerta.dart';
import 'package:carritocompras/models/ordenes_model.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordenesBloc = BlocProvider.of<OrdenesBloc>(context);
    ordenesBloc.add(CargarOrdenes());

    return Scaffold(
        appBar: AppBar(
          title: Text('Orders',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400)),
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
              MediaQuery.of(context).size.height * 0.14),
          child: BlocBuilder<OrdenesBloc, OrdenesState>(
            builder: (context, state) {
              if (state.existeOrden) {
                return ListView.builder(
                  itemCount: state.ordenes.length,
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
                                style: TextStyle(fontSize: 11),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Quantity: ${state.ordenes[i].cantidad}',
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Total: \$${state.ordenes[i].total}',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    'State: ',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${state.ordenes[i].estado}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: (state.ordenes[i].estado ==
                                                'Completed')
                                            ? Colors.green
                                            : Colors.yellow),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        mostrarAlerta(context, 'Erase Order',
                                            'Are you sure you want to erase Order?',
                                            () {
                                          ordenesBloc.add(
                                              BorrarOrden(state.ordenes[i]));

                                          Navigator.pushNamed(context, 'lista');
                                        });
                                      }),
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
                                              cantidad:
                                                  state.ordenes[i].cantidad,
                                              estado: 'Completed',
                                              total: state.ordenes[i].total,
                                              id_base:
                                                  state.ordenes[i].id_base);
                                          ordenesBloc
                                              .add(CompletedOrden(completed));

                                          Navigator.pushNamed(
                                              context, 'orders');
                                        }
                                      }),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    'There is no Order.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                );
              }
            },
          ),
        ));
  }
}
