import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_colors.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_text_styles.dart';

class CardsTelas extends StatelessWidget {
  final String label;
  final String imagem;

  CardsTelas({
    Key key,
    this.label,
    this.imagem,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular((10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(imagem),
          ),
          SizedBox(height: 40),
          Text(label, style: AppTextStyles.heading15),
          SizedBox(height: 20),
          Row(children: [
            Expanded(
              flex: 4,
              child: LinearProgressIndicator(
                value: 10,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ],)
        ],
      ),
    );
  }
}