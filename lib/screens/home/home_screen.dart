import 'package:flutter/material.dart';
import 'package:islamy/screens/home/tabs/quran_tab.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/widgets/base_tab.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0 ;
  List<Widget>tabs = [
    BaseTab(image: "assets/images/quran_bg.png", content: QuranTab(),),
    BaseTab(image: "assets/images/hadith_bg.png", content: Container(color: Colors.blueGrey,),),
    BaseTab(image: "assets/images/sebha_bg.png", content: Container(color: Colors.blue,),),
    BaseTab(image: "assets/images/radio_bg.png", content: Container(color: Colors.yellowAccent,),),
    BaseTab(image: "assets/images/more_bg.png", content: Container(color: Colors.orange,),),

  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.gold,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.black,
          type: .fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
              currentIndex = index ;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon:selectedIcon(currentIndex==0,"assets/images/ic_quran.png" ),
                label: "Quran",
            ),

            BottomNavigationBarItem(
              icon:selectedIcon(currentIndex==1,"assets/images/ic_hadeth.png" ),
              label: "Hadith",
            ),

            BottomNavigationBarItem(
              icon:selectedIcon(currentIndex==2,"assets/images/ic_sebha.png" ),
              label: "Sebha",
            ),

            BottomNavigationBarItem(
              icon:selectedIcon(currentIndex==3,"assets/images/ic_radio.png" ),
              label: "radio",
            ),

            BottomNavigationBarItem(
              icon:selectedIcon(currentIndex==4,"assets/images/ic_time.png" ),
              label: "time",
            ),

      ]),

      body: tabs[currentIndex],
    );

  }
  Widget selectedIcon(bool isSelected ,String imagePath ){
    return Container(
      padding: EdgeInsetsGeometry.all(10),
      decoration: BoxDecoration(
      color: isSelected ? AppColors.black.withAlpha(70) : Colors.transparent ,
      borderRadius: BorderRadius.circular(16)
      ),
      child: ImageIcon(AssetImage(imagePath)),
    );
  }
}
