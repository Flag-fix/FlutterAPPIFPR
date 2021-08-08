import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_colors.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_text_styles.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/card/cardCadastro.dart';

class AppBarTelas extends PreferredSize {
  final String labell;
  final BuildContext context;

  AppBarTelas(this.labell, this.context)
      : super(
      preferredSize: Size.fromHeight(90),
      child: AppBar(
          flexibleSpace: Container(
            height: 200,
            child: Stack(children: [
              Container(
                height: 180,
                padding:
                const EdgeInsets.only(left: 45, bottom: 5, right: 20),
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
                alignment: Alignment(0.0,2),
                child: CardCadastro(
                  label: labell,
                ),
              )
            ]),
          )));

}