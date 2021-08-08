import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_images.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/form/new_pessoa_form.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/details/pessoa_details.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/list/pessoa_list.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/homePage/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyApp extends StatelessWidget {
  static const HOME = 'home';
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
        PESSOA_DETAILS: (context) => PessoaDetails()
      },
      home: AnimatedSplashScreen(
        splash: Image.asset(AppImages.zakSistemas),
        nextScreen: MyHomePage(),
        splashIconSize: 300,
        splashTransition: SplashTransition.scaleTransition,
        duration: 5*1000,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}
