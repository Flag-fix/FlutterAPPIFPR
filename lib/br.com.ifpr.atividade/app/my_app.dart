import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_images.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/form/new_cavalo_form.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/details/cavalo_details.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/list/cavalo_list.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/homePage/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyApp extends StatelessWidget {
  static const HOME = 'home';
  static const CAVALO_LISTA = 'lista';
  static const CAVALO_FORM = 'cavalo-form';
  static const CAVALO_DETAILS = 'cavalo-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação para Controle de Entrada de Cavalos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        HOME: (context) => MyHomePage(),
        CAVALO_LISTA: (context) => CavaloList(),
        CAVALO_FORM: (context) => NewCavaloForm(),
        CAVALO_DETAILS: (context) => CavaloDetails()
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
