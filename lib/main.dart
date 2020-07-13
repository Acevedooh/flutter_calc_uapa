import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
//import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

String strInput = "";
final txtEntrada = TextEditingController();
final txtResultado = TextEditingController();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    txtEntrada.addListener(() {});
    txtResultado.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "0",

                    //TEXTO 1
                    hintStyle: TextStyle(
                      fontSize: 40,
                    )),
                style: TextStyle(
                  //TEXTO RESULTADO
                  fontSize: 40,
                ),
                textAlign: TextAlign.right,
                controller: txtEntrada,
                onTap: () =>
                    FocusScope.of(context).requestFocus(new FocusNode()),
              )),
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: new InputDecoration.collapsed(
                  hintText: "Resultado",
                  fillColor: Colors.deepPurpleAccent,
                  //    hintStyle: TextStyle(fontFamily: 'Rob')
                ),
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold
                    // color: Colors.deepPurpleAccent
                    ),
                textAlign: TextAlign.right,
                controller: txtResultado,
              )),
          SizedBox(height: 15.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.blueGrey[50],
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      btnAC('AC', Colors.blueGrey[100]),
                      btnBorrar(),
                      boton(
                        '%',
                        Colors.blueGrey[100],
                      ),
                      boton(
                        '/',
                        Colors.blueGrey[100],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      boton('7', Colors.blueGrey[50]),
                      boton('8', Colors.blueGrey[50]),
                      boton('9', Colors.blueGrey[50]),
                      boton(
                        '*',
                        Colors.blueGrey[100],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      boton('4', Colors.blueGrey[50]),
                      boton('5', Colors.blueGrey[50]),
                      boton('6', Colors.blueGrey[50]),
                      boton(
                        '-',
                        Colors.blueGrey[100],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      boton('1', Colors.blueGrey[50]),
                      boton('2', Colors.blueGrey[50]),
                      boton('3', Colors.blueGrey[50]),
                      boton('+', Colors.blueGrey[100]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      boton('0', Colors.blueGrey[50]),
                      SizedBox(width: 75.0),
                      boton('.', Colors.blueGrey[50]),
                      btnIgual(),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget boton(btntxt, Color btnColor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          setState(() {
            txtEntrada.text = txtEntrada.text + btntxt;
          });
        },
        color: btnColor,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget btnAC(btntext, Color btnColor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntext,
          style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            txtEntrada.text = "";
            txtResultado.text = "";
          });
        },
        color: btnColor,
        padding: EdgeInsets.all(18.0),
        //S  splashColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget btnBorrar() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child:
            Text("+/-", style: TextStyle(fontSize: 28.0, color: Colors.white)),
        onPressed: () {
          txtEntrada.text = (double.parse(txtEntrada.text) * -1).toString();
        },
        color: Colors.blueGrey[100],
        padding: EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget btnIgual() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          '=',
          style: TextStyle(
              fontSize: 28.0, color: Colors.black, fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          Parser p = new Parser();
          ContextModel cm = new ContextModel();
          Expression exp = p.parse(txtEntrada.text);
          setState(() {
            txtResultado.text =
                exp.evaluate(EvaluationType.REAL, cm).toString();
          });
        },
        color: Colors.blueGrey[300],
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
