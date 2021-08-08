import 'package:flutter/cupertino.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_colors.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/style/app_images.dart';

class CardInicialWidget extends StatelessWidget {
  const  CardInicialWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15)
        ),
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Image.asset(AppImages.zakSistemas),
        ),
      ),
    );
  }
}
