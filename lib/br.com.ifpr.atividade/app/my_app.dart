import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/new_pessoa_form.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/pessoa_details.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/pessoa_form.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/pessoa_list.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/my_home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const PESSOA_LISTA = 'lista';
  static const PESSOA_FORM = 'pessoa-form';
  static const PESSOA_DETAILS = 'pessoa-details';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação para Controle de Entrada de Pessoas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        HOME: (context) => MyHomePage(),
        PESSOA_LISTA: (context) => PessoaList(),
        PESSOA_FORM: (context) => NewPessoaForm(),
        PESSOA_DETAILS:(context) => PessoaDetails()
      },
    );
  }
}