import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/new_pessoa_form.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/pessoa_form.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/pessoa_list.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/my_home_page.dart';
import 'package:flutter/material.dart';

class Definition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação para Controle de Entrada de Pessoas',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        '/': (_) => MyHomePage(),
        'lista': (_) => PessoaList(),
/*        'form': (_) => PessoaForm()*/
        'form': (_) => NewPessoaForm()
      },
    );
  }
}