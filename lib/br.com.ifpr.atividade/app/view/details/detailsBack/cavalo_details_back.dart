import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newCavalo.dart';
import 'package:url_launcher/url_launcher.dart';


class CavaloDetailsBack{
  BuildContext context;
  NewCavalo cavalo;

  CavaloDetailsBack(this.context){
    cavalo = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function (BuildContext context) showModalError) async {
    await canLaunch(url) ? launch(url) : showModalError(context);
  }

  lauchPhone(Function (BuildContext context) showModalError){
    _launchApp('tel:${cavalo.contato}', showModalError);
  }
  lauchMessage(Function (BuildContext context) showModalError){
    _launchApp('sms:${cavalo.contato}', showModalError);
  }

}