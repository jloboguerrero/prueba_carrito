import 'package:animate_do/animate_do.dart';
import 'package:carritocompras/bloc/producto/producto_bloc.dart';
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
                top: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'lista');
                  },
                  elevation: 0,
                  child:
                      Icon(Icons.chevron_left, color: Colors.white, size: 60),
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
                          descripcion:
                              "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
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
                    delay: Duration(seconds: 1),
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
                                    print('Uno menos');
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
                                    print('Uno mas');
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
                print(_cantidad);
                Navigator.pushNamed(context, 'lista');
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff91CF50),
                ),
                child: Text(
                  'Agregar al carrito',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
