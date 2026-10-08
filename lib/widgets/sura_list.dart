import 'package:flutter/material.dart';
import 'package:islamy/models/sura.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/theme/text_style.dart';

class SuraList extends StatelessWidget {
  const SuraList({super.key, required this.sura});
   final Sura sura ;

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      Stack(
        alignment: .center,
          children:[
            ImageIcon(AssetImage("assets/images/sura_no.png") , color: AppColors.white , size: 70,),
            Text( sura.id.toString() , style: titleMedium(color: AppColors.white),),
      ]),
      Expanded(
        child: Column(
          spacing: 8,
          crossAxisAlignment: .start,
          children: [
            Text(sura.nameEn , style: titleLarge(color: AppColors.white),),
            Text("${sura.verses } Verses", style: titleMedium(color: AppColors.white),),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(sura.nameAr , style: titleLarge(color: AppColors.white),),
      ),
    ],
          );
  }
}
