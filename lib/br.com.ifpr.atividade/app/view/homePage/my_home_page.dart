import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/my_app.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_images.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/appBar/appBar.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/card/cardsTelas.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                children: [
                  Container(
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: CardsTelas(
                          label: "Cadastrar Pessoas",
                          imagem: AppImages.addPessoa,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(MyApp.PESSOA_FORM);
                        },
                      ),
                    ),
    ),
                  Container(
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: CardsTelas(
                          label: "Lista de Pessoas",
                          imagem: AppImages.listaDePessoas,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(MyApp.PESSOA_LISTA);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
