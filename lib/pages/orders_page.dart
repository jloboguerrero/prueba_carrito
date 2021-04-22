import 'package:carritocompras/bloc/ordenes/ordenes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordenesBloc = BlocProvider.of<OrdenesBloc>(context);
    ordenesBloc.add(CargarOrdenes());

    return Scaffold(
        appBar: AppBar(
          title: Text('Ordenes', style: TextStyle(fontSize: 24.0)),
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
                                'Cantidad: ${state.ordenes[i].cantidad}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Monto: ${state.ordenes[i].total}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            'Estado: ${state.ordenes[i].estado}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {
                                print('change');
                              })
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    'Aún no hay ninguna orden.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                );
              }
            },
          ),
        ));
  }
}
