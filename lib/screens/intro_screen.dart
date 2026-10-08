import 'package:flutter/material.dart';
import 'package:islamy/screens/home_screen.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/theme/text_style.dart';
import 'package:islamy/widgets/intro_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
 const IntroScreen({super.key});
  static const routeName = "/intro";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller =  PageController() ;
  int _currentPage = 0 ;
  final int _lastPage = 5 ;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body:SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/img_header.png") ,

            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index){
                  setState(() {
                    _currentPage = index ;
                  });
                },
                children: [
                  IntroPage(image: "assets/images/first_intro.png", headText: "Welcome To Islmi App" , activeSubText: false, ),
                  IntroPage(image: "assets/images/second_intro.png", headText: "Welcome To Islmi App" ,subText: "We Are Very Excited To Have You In Our Community",),
                  IntroPage(image: "assets/images/third_intro.png", headText: "Reading the Quran" , subText:"Read, and your Lord is the Most Generous",),
                  IntroPage(image: "assets/images/fourth_intro.png", headText: "Bearish" , subText: "Praise the name of your Lord, the Most High",),
                  IntroPage(image: "assets/images/fifth_into.png", headText: "Holy Quran Radio" , subText:"You can listen to the Holy Quran Radio through the application for free and easily" ,)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8 , right: 8, bottom: 16 , top: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage==0 ? Container() :
                  TextButton(onPressed: (){
                    _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn) ;
                  }, child:Text("back" ,style:titleMedium() ,)) ,
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 5 ,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.gold ,
                      dotColor: AppColors.gray ,
                      dotHeight: 10 ,
                      dotWidth: 10 ,
                      spacing: 10 ,
                    ),
                  ),
                  TextButton(onPressed: (){
                    _currentPage==_lastPage-1  ? Navigator.pushNamed(context, HomeScreen.routeName) :
                    _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn) ;
                  }, child:Text("next" ,style:titleMedium() ,)) ,

                ],
              ),
            )
          ],
        ),
      )) ,
    );
  }
}
