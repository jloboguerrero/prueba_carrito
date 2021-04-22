import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10.0),
        children: <Widget>[
          ListTile(
            title: Text(
              'Términos y condiciones',
            ),
            leading: Container(
              margin: EdgeInsets.only(left: 3.0),
              child: Icon(
                Icons.ac_unit_outlined,
                color: Color(0xffa2bd31),
                size: 28,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, 'terminos'),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Acerca de esta app',
            ),
            leading: Icon(
              Icons.access_alarm,
              color: Color(0xffa2bd31),
              size: 28,
            ),
            onTap: () => Navigator.pushNamed(context, 'informacion'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
