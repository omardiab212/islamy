import 'package:flutter/material.dart';
import 'package:islamy/widgets/sura_list.dart';

import '../models/sura.dart';
import '../screens/home/tabs/quran_tab.dart';
import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class QuranTabLayout extends StatelessWidget {
  const QuranTabLayout({super.key });



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 16,),),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 32,),
              child: Text("Suras List" , style: titleLarge(color: AppColors.white),),),
          ),
          SliverList.separated(
              itemBuilder:(_ , index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 8),
                child: SuraList(sura: sura[index],),),
              separatorBuilder: (_,_) => Divider( color: AppColors.white, indent: 40, endIndent: 40,),
              itemCount: 114)
        ]
      ),
    );
  }
}
