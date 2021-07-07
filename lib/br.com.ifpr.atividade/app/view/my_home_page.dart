import 'package:flutter/material.dart';

import '../../controle_main.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final controle = ControleMain();

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
            SizedBox(
              height: 30,
            ),
            Container(
              child: Center(
                child: Text(
                  'Controle de Entrada',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    fontSize: 26
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
