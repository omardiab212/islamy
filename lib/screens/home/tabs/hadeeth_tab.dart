import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/models/hadeeth.dart';
import 'package:islamy/screens/hadith_screen.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/theme/text_style.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});


  @override
  State<HadeethTab> createState() => _HadeethTabState();

}
List<Hadeeth> ahadeeth = [] ;

class _HadeethTabState extends State<HadeethTab> {
  @override
  void initState() {
    super.initState();
    laodElhadeeth() ;
  }
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
          itemCount: ahadeeth.length,
          itemBuilder: (BuildContext context, int itemIndex, _ )=>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, HadithScreen.routeName , arguments: ahadeeth[itemIndex]);
          },
          child: Container(
             decoration: BoxDecoration(
               color: AppColors.gold ,
               image: DecorationImage(image: AssetImage("assets/images/HadithCardBackGround 1.png")),
             ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Transform.flip(
                        flipX: true,
                          child: Image.asset("assets/images/right_corner.png")),
                      Expanded(child: Text(ahadeeth[itemIndex].title, textAlign:.center , style: titleMedium(color: AppColors.black),)),
                      Image.asset("assets/images/right_corner.png"),
                    ],
                  ),
                  Expanded(child: Text(ahadeeth[itemIndex].content , textAlign: .center,style: titleSmall(color: AppColors.black),))
                ],
              ),
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        height: double.infinity,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
        );
  }

 Future<void> laodElhadeeth()async {
    for(int i = 1 ; i<=50 ; i++){
      var hadeeth =await rootBundle.loadString("assets/files/Hadeeth/h$i.txt") ;
      var hadeethContent = hadeeth.trim().split("\n").map((content){return content.trim();}).toList();
      var hadeethTitle =hadeethContent.first ;
      var hadeethBody = hadeethContent.sublist(1).join(" ");
      ahadeeth.add(Hadeeth(i, hadeethTitle, hadeethBody)) ;
      setState(() {

      });
    }
 }
}
