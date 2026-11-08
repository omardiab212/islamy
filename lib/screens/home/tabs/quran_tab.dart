import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamy/models/sura.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/theme/text_style.dart';
import 'package:islamy/widgets/quran_search_layout.dart';
import 'package:islamy/widgets/quran_tab_layout.dart';
import 'package:lottie/lottie.dart';


typedef SuraWidgitOnClickCallBack = Future<void> Function(Sura) ;

class QuranTab extends StatefulWidget {
   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();

}

class _QuranTabState extends State<QuranTab> {
  TextEditingController controller = TextEditingController(text: "");
  List<Sura>searchResult = [];
  Timer? _debounceTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener((){

        if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

        _debounceTimer = Timer(const Duration(milliseconds: 500), () {
          searchSura(controller.text);
        });


    });
  }


  void searchSura(String input){
    if(input.isEmpty){
      searchResult = [] ;
      setState(() {
      });
      return ;
    }
    if(RegExp(r'^[a-zA-Z]+').hasMatch(input)){
      searchResult = sura.where((sura) => sura.nameEn.toLowerCase().contains(input.toLowerCase())).toList();

    }
    else{
      searchResult = sura.where((sura) => sura.nameAr.toLowerCase().contains(input.toLowerCase())).toList();

    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
       crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 24),
          child: TextField(
            controller: controller,
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


          if(searchResult.isEmpty && controller.text.isEmpty)
            QuranTabLayout()

          else if(searchResult.isEmpty && controller.text.isNotEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  LottieBuilder.asset("assets/animations/Man reads Quran on Ramadan.json" , height: MediaQuery.sizeOf(context).height*.5,),
                  Text("No Suras Found" , style: titleMedium(),)
                ],
              ),
            ),
          )

        else
          QuranSearchLayout(suralist: searchResult,),
      ],
    );
  }
}
