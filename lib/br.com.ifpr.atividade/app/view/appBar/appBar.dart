import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_colors.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_text_styles.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/card/cardInicial.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
      preferredSize: Size.fromHeight(90),
      child: AppBar(
        flexibleSpace: Container(
          height: 200,
          child: Stack(children: [
            Container(
              height: 180,
              padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
              width: double.maxFinite,
              color: Colors.deepPurple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      text: "Seja,  ",
                      style: AppTextStyles.title,
                      children: [
                        TextSpan(
                            text: "Bem Vindo",
                            style: AppTextStyles.titleBold)
                      ])),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://avatars.githubusercontent.com/u/61293301?v=4"))),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment(0.0, 2.0),
              child: CardInicialWidget(),
            )
          ]),
        ),
      ));
}
