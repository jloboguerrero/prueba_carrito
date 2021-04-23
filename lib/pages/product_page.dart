import 'package:animate_do/animate_do.dart';
import 'package:carritocompras/bloc/pedido/pedido_bloc.dart';
import 'package:carritocompras/bloc/producto/producto_bloc.dart';
import 'package:carritocompras/models/pedido_model.dart';
import 'package:carritocompras/widgets/articulo_desc.dart';
import 'package:carritocompras/widgets/articulo_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(tag: 'artículo 1', child: ArticuloSizePreview()),
              Positioned(
                top: 30,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'lista');
                  },
                  elevation: 0,
                  child: Icon(Icons.cancel, color: Colors.white, size: 30),
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
          BlocBuilder<ProductoBloc, ProductoState>(
            builder: (context, state) {
              if (state.existeProducto) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ArticuloDescripcion(
                          titulo: '${state.producto.nombre}',
                          descripcion: '${state.producto.desc_largo}',
                        ),
                        _MontoBuyNow(),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class _MontoBuyNow extends StatefulWidget {
  @override
  __MontoBuyNowState createState() => __MontoBuyNowState();
}

class __MontoBuyNowState extends State<_MontoBuyNow> {
  int _cantidad = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                BlocBuilder<ProductoBloc, ProductoState>(
                  builder: (context, state) {
                    if (state.existeProducto) {
                      return Text(
                        '\$${state.producto.precio}',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Spacer(),
                Bounce(
                    delay: Duration(milliseconds: 300),
                    from: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                  offset: Offset(0.0, 1.0))
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                          padding: EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(height: 8.0),
                              IconButton(
                                  icon: Icon(Icons.remove),
                                  splashRadius: 0.01,
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      if (_cantidad >= 1) {
                                        _cantidad--;
                                      }
                                    });
                                  }),
                              Text(
                                '$_cantidad',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                    color: Colors.white),
                              ),
                              IconButton(
                                  icon: Icon(Icons.add),
                                  color: Colors.white,
                                  splashRadius: 0.01,
                                  onPressed: () {
                                    setState(() {
                                      if (_cantidad < 9) {
                                        _cantidad++;
                                      }
                                    });
                                  }),
                              SizedBox(height: 8.0),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (_cantidad != 0) {
                  final producto =
                      BlocProvider.of<ProductoBloc>(context).state.producto;
                  final pedido = PedidoModel(
                      cantidad: _cantidad,
                      id: producto.id,
                      fotourl: producto.fotourl,
                      idCarrito: 1,
                      nombre: producto.nombre,
                      precio: producto.precio);
                  final pedidoBloc = BlocProvider.of<PedidoBloc>(context);
                  pedidoBloc.add(CrearPedido(pedido));
                }

                Navigator.pushNamed(context, 'lista');
              },
              child: Container(
                margin: EdgeInsets.only(top: 12),
                alignment: Alignment.center,
                width: 250,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff91CF50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Agregar al carrito',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
