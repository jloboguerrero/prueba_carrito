import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarritoPage extends StatefulWidget {
  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de pedido',
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
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
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
                                  width: 150,
                                  height: 150,
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          'https://res.cloudinary.com/dk8wa52ru/image/upload/v1616713712/q9e86vmuzxytckslrbvn.jpg', //'${item.image}' + '?alt=media',
                                      fit: BoxFit.cover,
                                      placeholder: (_, __) {
                                        return Center(
                                            child: CupertinoActivityIndicator(
                                          radius: 15,
                                        ));
                                      }),
                                )),
                                Column(
                                  children: <Widget>[
                                    Text('Test01', //item.name,
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
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              )),
                                          margin: EdgeInsets.only(top: 20.0),
                                          padding: EdgeInsets.all(2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.remove),
                                                onPressed: () {
                                                  setState(() {
                                                    // _cart[index].quantity--;
                                                    // valorTotal(_cart);
                                                  });
                                                },
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  '3', //'${_cart[index].quantity}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22.0,
                                                      color: Colors.white)),
                                              IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  setState(() {
                                                    // _cart[index].quantity++;
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
                                Text('234.21', //item.price.toString(),
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
              ),
              SizedBox(
                width: 10.0,
              ),
              //pagoTotal(_cart),
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
                  child: Text("PAGAR"),
                  onPressed: () => {
                    print('object02')
                    /* showDialog(
                        context: context,
                        builder: (BuildContext context) => FancyDialog(
                              title: "Aceptar compra",
                              descreption: "Enviar por WhatsApp",
                              animationType: FancyAnimation.BOTTOM_TOP,
                              theme: FancyTheme.FANCY,
                              gifPath: './assets/images/buy2.gif',
                              okFun: () => {
                                msgListaPedido(),
                              },
                            )) */
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
