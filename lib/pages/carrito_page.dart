import 'package:cached_network_image/cached_network_image.dart';
import 'package:carritocompras/bloc/ordenes/ordenes_bloc.dart';
import 'package:carritocompras/bloc/pedido/pedido_bloc.dart';
import 'package:carritocompras/models/ordenes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarritoPage extends StatefulWidget {
  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  @override
  Widget build(BuildContext context) {
    final pedidoBloc = BlocProvider.of<PedidoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del pedido',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              //_cart.length;
            });
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BlocBuilder<PedidoBloc, PedidoState>(
                builder: (_, state) {
                  if (state.existePedido) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.pedidos.length,
                      itemBuilder: (context, index) {
                        final multi = state.pedidos[index].cantidad *
                            state.pedidos[index].precio;

                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                        width: 100,
                                        height: 100,
                                        child: CachedNetworkImage(
                                            imageUrl:
                                                '${state.pedidos[index].fotourl}', //'${item.image}' + '?alt=media',
                                            fit: BoxFit.contain,
                                            placeholder: (_, __) {
                                              return Center(
                                                  child:
                                                      CupertinoActivityIndicator(
                                                radius: 15,
                                              ));
                                            }),
                                      )),
                                      SizedBox(width: 30),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                              '${state.pedidos[index].nombre}', //item.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                  color: Colors.black)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 120,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Color(0xff91CF50),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 6.0,
                                                        color: Colors.blue[400],
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(50.0),
                                                    )),
                                                margin:
                                                    EdgeInsets.only(top: 20.0),
                                                padding: EdgeInsets.all(2.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 8.0,
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.remove),
                                                      onPressed: () {
                                                        setState(() {
                                                          state.pedidos[index]
                                                              .cantidad--;
                                                          // valorTotal(_cart);
                                                          pedidoBloc.add(
                                                              EditPedido(
                                                                  state.pedidos[
                                                                      index]));
                                                        });
                                                      },
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                        '${state.pedidos[index].cantidad}', //'${_cart[index].quantity}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 22.0,
                                                            color:
                                                                Colors.white)),
                                                    IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: () {
                                                        setState(() {
                                                          state.pedidos[index]
                                                              .cantidad++;
                                                          // valorTotal(_cart);
                                                        });
                                                      },
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 8.0,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 38.0,
                                      ),
                                      Text('\$$multi', //item.price.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24.0,
                                              color: Colors.black))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.green,
                            )
                          ],
                        );
                      },
                    );
                  }
                  return Center(child: Text('No hay pedido'));
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              //pagoTotal(_cart),
              BlocBuilder<PedidoBloc, PedidoState>(
                builder: (_, state) {
                  if (state.existePedido) {
                    var total = 0;
                    for (var i = 0; i < state.pedidos.length; i++) {
                      total = total +
                          state.pedidos[i].cantidad * state.pedidos[i].precio;
                    }

                    return Container(
                      width: double.infinity,
                      height: 40,
                      padding: EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Total = \$$total',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 100,
                width: 200,
                padding: EdgeInsets.only(top: 50),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text("CONFIRMAR"),
                  onPressed: () {
                    final ordenProvider = BlocProvider.of<OrdenesBloc>(context);

                    var cantidad = 0;
                    var total = 0;

                    for (var i = 0; i < pedidoBloc.state.pedidos.length; i++) {
                      cantidad =
                          cantidad + pedidoBloc.state.pedidos[i].cantidad;
                      total = total +
                          (pedidoBloc.state.pedidos[i].cantidad *
                              pedidoBloc.state.pedidos[i].precio);
                    }

                    final orden = OrdenesModel(
                        cantidad: cantidad, total: total, estado: 'Pending');
                    ordenProvider.add(CrearOrden(orden));

                    for (var i = 0; i < pedidoBloc.state.pedidos.length; i++) {
                      pedidoBloc.add(BorrarPedido(pedidoBloc.state.pedidos[i]));
                    }

                    Navigator.pushNamed(context, 'orders');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
