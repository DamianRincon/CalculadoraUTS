import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculadoraPage extends StatefulWidget {
  CalculadoraPage({Key key}) : super(key: key);

  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  // variables
  String expresion;
  String result;


  @override
  void initState() { 
    super.initState();
    expresion = "";
    result = "0";
  }

  final _colorPrimary = Color(0xff8347B5);
  
  final _gradientColors = [
    Color(0xff8347B5),
    Colors.deepPurple[500],
    Colors.deepPurple[600],
    Colors.deepPurple[800],
    Colors.purple[900],
    Colors.black87
  ];
  
  final _styleDefault = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
    color: Colors.white
  );

  final _styleOperation = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
    color: Color(0xff8347B5)
  );

  _changeState(String value) {
    setState(() {
      expresion += value;
    });
  }

  _makeResult(){
    try {
      Parser p = new Parser();
      ContextModel cm = new ContextModel();
      Expression exp = p.parse(expresion);
      setState(() {
        result = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    } catch (e) {
      setState(() {
        result = "Sintaxis Error";
      });
    }
  }

  _delete() {     
    setState(() {
      expresion = (expresion.length> 1 && expresion != "") ?
      expresion.substring(0, expresion.length-1) : "";
    });
  }

  _clear() {
    setState(() {
      expresion = "";
      result = "0";
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height * 0.4,
                padding: EdgeInsets.only(right: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(expresion, style: _styleDefault),
                    Text(result, style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ))
                  ]
                )
              ),  
              Container(
                height: size.height * 0.60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: (){}, child: Text("AC", style: _styleDefault,)
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _clear(), child: Text("C", style: _styleDefault,)),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: (){}, child: Text("%", style: _styleDefault,)),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: (){}, child: Text("/", style: _styleOperation,))
                      ]
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("7"), 
                          child: Text(
                            "7",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("8"), 
                          child: Text(
                            "8",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("9"), 
                          child: Text(
                            "9",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("*"), 
                          child: Text(
                            "*",
                            style: _styleOperation,
                          )
                        )
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("4"), 
                          child: Text(
                            "4",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("5"), 
                          child: Text(
                            "5",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("6"), 
                          child: Text(
                            "6",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("-"), 
                          child: Text(
                            "-",
                            style: _styleOperation,
                          )
                        )
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("1"), 
                          child: Text(
                            "1",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("2"), 
                          child: Text(
                            "2",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("3"), 
                          child: Text(
                            "3",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("+"), 
                          child: Text(
                            "+",
                            style: _styleOperation,
                          )
                        )
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("0"), 
                          child: Text(
                            "0",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _changeState("."), 
                          child: Text(
                            ".",
                            style: _styleDefault,
                          )
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          onPressed: () => _delete(), 
                          child: Icon(Icons.backspace, color: Colors.white)
                        ),
                        FlatButton(
                          onPressed: () => _makeResult(), 
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: _colorPrimary
                            ),
                            child: Center(
                              child: Text("=", style: _styleDefault),
                            ),
                          )
                        )
                      ]
                    ),
                    SizedBox(height: 20)
                  ]
                )
              )
            ]
          )
        ]
      )
    );
  }
}
