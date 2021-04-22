import 'package:flutter/material.dart';

class BotonPersonalizado extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final Color colorFondo;
  final Color colorLetras;
  final double tamanoLetras;
  final Function onTap;

  const BotonPersonalizado(
      {@required this.texto,
      this.alto = 50.0,
      this.ancho = 250.0,
      this.colorFondo = Colors.white,
      this.colorLetras = Colors.purple,
      this.tamanoLetras = 28,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: ancho,
        height: alto,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorFondo,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(4, 6),
                  blurRadius: 10)
            ]),
        child: Text(
          '$texto',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      onTap: onTap,
    );
  }
}

class BotonPersonalizado2 extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final Color colorFondo;
  final Color colorLetras;
  final double tamanoLetras;
  final Function onTap;
  final int color1;
  final int color2;

  const BotonPersonalizado2(
      {@required this.texto,
      this.alto = 50.0,
      this.ancho = 250.0,
      this.colorFondo = Colors.white,
      this.colorLetras = Colors.purple,
      this.tamanoLetras = 28,
      this.color1 = 0xff91CF50,
      this.color2 = 0xff034D53,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: ancho,
        height: alto,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(color1),
                Color(color2),
              ]),
        ),
        child: Text('$texto'),
      ),
      onTap: onTap,
    );
  }
}

class BotonPersonalizado3 extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final Color colorFondo;
  final Color colorLetras;
  final double tamanoLetras;
  final Function onTap;
  final int color1;
  final int color2;

  const BotonPersonalizado3(
      {@required this.texto,
      this.alto = 50.0,
      this.ancho = 250.0,
      this.colorFondo = Colors.white,
      this.colorLetras = Colors.purple,
      this.tamanoLetras = 28,
      this.color1 = 0xff91CF50,
      this.color2 = 0xff034D53,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: ancho,
        height: alto,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(color1),
                  Color(color2),
                ]),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(4, 6),
                  blurRadius: 10)
            ]),
        child: Text(
          '$texto',
          style: TextStyle(
              color: colorLetras,
              fontSize: tamanoLetras,
              fontWeight: FontWeight.w400,
              fontFamily: 'helvetic'),
        ),
      ),
      onTap: onTap,
    );
  }
}
