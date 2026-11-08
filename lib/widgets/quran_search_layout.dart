import 'package:flutter/material.dart';
import 'package:islamy/widgets/sura_list.dart';
import '../models/sura.dart';
import '../screens/home/tabs/quran_tab.dart';
import '../theme/app_colors.dart';

class QuranSearchLayout extends StatelessWidget {
  const QuranSearchLayout({super.key , required this.suralist});
  final List<Sura> suralist ;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.separated(
          itemBuilder:(_ , index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 8),
            child: SuraList(sura: suralist[index],)
            ,),
          separatorBuilder: (_,_) => Divider( color: AppColors.white, indent: 40, endIndent: 40,),
          itemCount: suralist.length),
    );
  }
}
