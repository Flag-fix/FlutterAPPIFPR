import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../controle_main.dart';
import '../my_app.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final controle = ControleMain();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Widget botaoTela(String label,BuildContext context, String rota) {
  return Container(
    height: 50,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: SizedBox.expand(
      child: FlatButton(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(rota);
        },
      ),
    ),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Controle de Refeitório'),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed('form');
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/img/restaurante.png'),
            ),
            SizedBox(height: 30),
            Container(
              child: Center(
                child: Text(
                  'Lista de Contatos',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 26),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  botaoTela('Criar Contato',context, 'pessoa-form'),
                  SizedBox(height: 15,),
                  botaoTela('Agenda',context, 'lista'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
