import 'package:flutter/material.dart';

import '../theme/text_style.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key, required this.image, required this.headText,  this.subText, this.activeSubText = true});
  final String image ;
  final String headText ;
  final String ? subText ;
  final bool activeSubText ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Image.asset(image) ,
          Text(headText , style: titleLarge(fontSize: 24 ,)),
          activeSubText == false ? Container() :
          Center(child: Text(subText! , style:  titleLarge(fontSize: 20 ,) , textAlign: TextAlign.center,)),

        ],
      ),
    );
  }
}
