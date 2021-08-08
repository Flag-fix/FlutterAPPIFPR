import 'package:flutter/material.dart';
import 'br.com.ifpr.atividade/app/injection/injection.dart';
import 'br.com.ifpr.atividade/app/my_app.dart';

void main() async{
  runApp(MyApp());
  setupInjection();
}

