import 'package:carritocompras/widgets/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Color(0xff91CF50),
              Color(0xff034D53),
            ])),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/logo-min.png', width: 160, height: 160),
                SizedBox(height: 30),
                Text(
                  'Armería de\n compras',
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: 130,
        margin: EdgeInsets.only(bottom: 30),
        child: BotonPersonalizado(
          texto: 'INICIAR',
          onTap: () {
            Navigator.pushNamed(context, 'lista');
          },
          colorLetras: Color(0xff91CF50),
          alto: 50.0,
          ancho: 180,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
