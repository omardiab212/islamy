import 'package:flutter/material.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/theme/text_style.dart';

class SebhaTab extends StatefulWidget {
 const  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();

}
List<String>tasabeh=["استغفر الله" , "الحمد لله" , "الله أكبر"];
int count = 0 ;
int pointer = 0 ;
String tasbeha = tasabeh[0] ;
double _turn = 0;

class _SebhaTabState extends State<SebhaTab> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context) ;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 12,
        children: [
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى " , style: titleLarge(color: AppColors.white , fontSize: 32) ,),
          Image.asset("assets/images/SebhaHead.png" , height: size.height *.11,),
          InkWell(
            onTap: (){
              count++ ;
              _turn+=1/30 ;
                    if(count==33) {
                      count = 0 ;
                      pointer++ ;
                      if(pointer >= tasabeh.length){
                        pointer = 0 ;
                      }
                      tasbeha = tasabeh[pointer] ;
                    }
                    setState(() {

                    });

            },
            child: Stack(
              alignment: .center,
              children: [
                AnimatedRotation(
                    duration: Duration(milliseconds: 200) ,
                    curve:  Curves.easeInOut,
                    turns: _turn,
                child: Image.asset("assets/images/SebhaBody.png" ,)),
                Column(
                  spacing: 12,
                  children: [
                    Text(tasbeha, style: titleLarge(color: AppColors.white , fontSize: 32),) ,
                    Text("$count" , style: titleLarge(color: AppColors.white , fontSize: 32),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
