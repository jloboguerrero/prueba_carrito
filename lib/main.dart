import 'package:carritocompras/bloc/producto/producto_bloc.dart';
import 'package:carritocompras/pages/carrito_page.dart';
import 'package:carritocompras/pages/home_page.dart';
import 'package:carritocompras/pages/list_page.dart';
import 'package:carritocompras/pages/orders_page.dart';
import 'package:carritocompras/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductoBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carrito de compras',
        home: HomePage(),
        routes: {
          'home': (_) => HomePage(),
          'lista': (_) => ListPage(),
          'orders': (_) => OrdersPage(),
          'descripcion': (_) => ProductPage(),
          'carrito': (_) => CarritoPage()
        },
      ),
    );
  }
}
