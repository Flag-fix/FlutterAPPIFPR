import 'package:flutter/cupertino.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_colors.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_text_styles.dart';

class CardLista extends StatelessWidget {
  final String label;
  const  CardLista({Key key, this.label,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15)
        ),
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(label,style: AppTextStyles.heading30,),
        ),
      ),
    );
  }
}