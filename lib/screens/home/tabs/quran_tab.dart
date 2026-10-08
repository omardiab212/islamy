import 'package:flutter/material.dart';
import 'package:islamy/models/sura.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/theme/text_style.dart';
import 'package:islamy/widgets/sura_list.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
       crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 24),
          child: TextField(
            style: titleMedium(color: AppColors.white),
            decoration: InputDecoration(
              filled: true,
             fillColor: AppColors.black.withAlpha(90),
             hintText: "Sura Name",
             hintStyle: titleMedium(color: AppColors.white),
             prefixIcon:Padding(
               padding: const EdgeInsets.all(8.0),
                child: ImageIcon(AssetImage("assets/images/ic_quran.png") ,),) ,
             prefixIconColor: AppColors.gold,
             enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16) ,
                 borderSide:BorderSide(color: AppColors.gold , width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16) ,
                  borderSide:BorderSide(color: AppColors.gold , width: 2)),
              ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 32,),
          child: Text("Suras List" , style: titleLarge(color: AppColors.white),),),
        Expanded(child: ListView.separated(
            itemBuilder:(_ , index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 8),
              child: SuraList(sura: sura[index],),
            ),
            separatorBuilder: (_,_) => Divider( color: AppColors.white, indent: 40, endIndent: 40,),
            itemCount: 114))

      ],
    );
  }
}
