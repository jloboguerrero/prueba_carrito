import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:carritocompras/bloc/pedido/pedido_bloc.dart';
import 'package:carritocompras/bloc/producto/producto_bloc.dart';
import 'package:carritocompras/models/productos_model.dart';

class ListPage extends StatelessWidget {
  final ProductoModel producto = ProductoModel();

  @override
  Widget build(BuildContext context) {
    final productoBloc = BlocProvider.of<ProductoBloc>(context);
    final pedidoBloc = BlocProvider.of<PedidoBloc>(context);
    productoBloc.add(CargarProductos());
    pedidoBloc.add(CargarPedidos());
    return Scaffold(
      appBar: AppBar(
        title: Text('Weapons',
            style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w400)),
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
        elevation: 30.0,
        brightness: Brightness.dark,
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
            Navigator.pushNamed(context, 'home');
          },
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 10),
            splashColor: Colors.transparent,
            splashRadius: 0.5,
            icon: Icon(
              Icons.list_alt,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'orders');
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: BlocBuilder<ProductoBloc, ProductoState>(
        builder: (context, state) {
          if (state.existeProducto) {
            return ListaProductos(state.productos);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FadeInUp(
        delay: Duration(milliseconds: 1000),
        duration: Duration(milliseconds: 1000),
        child: GestureDetector(
          child: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.only(bottom: 10),
            child: Container(
                alignment: Alignment.center,
                width: 330.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color(0xff91CF50),
                        Color(0xff034D53),
                      ]),
                ),
                child: BlocBuilder<PedidoBloc, PedidoState>(
                  builder: (_, state) {
                    if (state.existePedido) {
                      final totalPedidos = state.pedidos.length;
                      var cantidad = 0;
                      var monto = 0;
                      for (var i = 0; i < totalPedidos; i++) {
                        cantidad = cantidad + state.pedidos[i].cantidad;
                        monto = monto +
                            (state.pedidos[i].precio *
                                state.pedidos[i].cantidad);
                      }
                      ;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 30,
                            height: 30,
                            color: Colors.black38,
                            child: Center(
                                child: Text(
                              '$cantidad',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                          ),
                          Row(
                            children: [
                              Text(
                                'Ver carrito',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text('\$ $monto',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          )
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 25,
                            height: 25,
                            color: Colors.black38,
                            child: Center(
                                child: Text(
                              '0',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                          ),
                          Text(
                            'Ver carrito',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                                color: Colors.white),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text('\$ 0',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          )
                        ],
                      );
                    }
                  },
                )),
          ),
          onTap: () {
            Navigator.pushNamed(context, 'carrito');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ListaProductos extends StatelessWidget {
  final List<ProductoModel> productos;
  const ListaProductos(this.productos);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).size.height * 0.14) /
          1.25,
      child: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (_, i) => FadeInRight(
            delay: Duration(milliseconds: 1200),
            duration: Duration(milliseconds: 1000),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '${productos[i].nombre}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${productos[i].descripcion}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(height: 30),
                                      Text(
                                        '\$${productos[i].precio} Dolars',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 30),
                                Expanded(
                                    child: Container(
                                  width: 120,
                                  height: 120,
                                  child: FadeInImage(
                                    placeholder:
                                        AssetImage('assets/jar-loading.gif'),
                                    image:
                                        NetworkImage('${productos[i].fotourl}'),
                                    fadeInDuration: Duration(milliseconds: 200),
                                    fit: BoxFit.cover,
                                  ),
                                ))
                              ],
                            ),
                            onTap: () {
                              final productoBloc =
                                  BlocProvider.of<ProductoBloc>(context);
                              final newProduct = ProductoModel(
                                  descripcion: productos[i].descripcion,
                                  disponible: true,
                                  fotourl: productos[i].fotourl,
                                  id: productos[i].id,
                                  nombre: productos[i].nombre,
                                  precio: productos[i].precio,
                                  desc_largo: productos[i].desc_largo);
                              productoBloc.add(AbreProducto(newProduct));
                              Navigator.pushNamed(context, 'descripcion');
                            }),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.green,
                )
              ],
            )),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(3.0),
      ),
    );
  }
}
