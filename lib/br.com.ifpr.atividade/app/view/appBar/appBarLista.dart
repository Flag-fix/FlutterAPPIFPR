import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/controller/cavalo_list_back.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_colors.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_text_styles.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/card/cardInicial.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/card/cardLista.dart';
class AppBarLista extends PreferredSize {
  AppBarLista(BuildContext context, CavaloListBack _back)
      : super(
      preferredSize: Size.fromHeight(90),
      child: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  _back.goToForm(context);
                })
          ],
          flexibleSpace: Container(
            height: 200,
            child: Stack(children: [
              Container(
                height: 180,
                padding:
                const EdgeInsets.only(left: 45, bottom: 0, right: 20),
                width: double.maxFinite,
                color: Colors.deepPurple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(
                        text: "Voltar", style: AppTextStyles.titleBold)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.0, 1.5),
                child: CardLista(
                  label: "Cavalos",
                ),
              )
            ]),
          )));
}
