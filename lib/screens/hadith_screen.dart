import 'package:flutter/material.dart';
import 'package:islamy/models/hadeeth.dart';

import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key, required this.hadith});
  static const routeName = "/hadith";
  final Hadeeth hadith ;


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text("hadith ${hadith.id}"),
        centerTitle: true,
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 120,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/img_left_corner.png", width: size.width * 0.2),
                      Expanded(
                        child: Text(
                          hadith.title ,
                          textAlign: TextAlign.center,
                          style: titleLarge(),
                        ),
                      ),
                      Transform.flip(
                        flipX: true,
                        child: Image.asset("assets/images/img_left_corner.png", width: size.width * 0.2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    hadith.content,
                    style: titleMedium(),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/img_bottom_decoration.png",
              height: size.height * .1,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
