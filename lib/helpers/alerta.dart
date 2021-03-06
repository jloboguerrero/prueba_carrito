import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

// Alerta personalizada para avisar al usuario si quiere borrar definitivamente

mostrarAlerta(
    BuildContext context, String titulo, String subtitulo, Function onPress) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(titulo),
        content: Text(subtitulo),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No'),
            elevation: 5,
            textColor: Colors.blue,
          ),
          MaterialButton(
            onPressed: onPress,
            child: Text('Yes'),
            elevation: 5,
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  } else if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(titulo),
        content: Text(subtitulo),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Yes'),
            onPressed: onPress,
          ),
        ],
      ),
    );
  }
}
