import 'package:flutter/material.dart';
import 'package:islamy/theme/app_colors.dart';

class BaseTab extends StatelessWidget {
  const BaseTab({super.key, required this.image, required this.content});
  final String image ;
  final Widget content ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: .cover, )
      ),
      child: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: .topCenter,
            end: .bottomCenter,
            colors: [
              AppColors.black.withAlpha(100) ,
              AppColors.black.withAlpha(80) ,
              AppColors.black ,
            ]),
        ) ,
        child: SafeArea(
          child: Column(
            children: [
              Center(child: Image.asset("assets/images/img_header.png")),
              Expanded(child: content)
            ],
          ),
        ),
      ) ,
    );
  }
}
