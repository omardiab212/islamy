import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/models/sura.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/theme/text_style.dart';

class SuraScreen extends StatefulWidget {
  SuraScreen({super.key, required this.sura});
  static const routeName = "/sura";
  final Sura sura ;


  @override
  State<SuraScreen> createState() => _SuraScreenState();

}



class _SuraScreenState extends State<SuraScreen> {
  String content = "" ;

  @override
  void initState() {
    super.initState();
    loadData() ;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(widget.sura.nameEn),
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
                          widget.sura.nameAr,
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
                  content.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Text(
                    content,
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

  Future<void> loadData() async{
    var response = await rootBundle.loadString('assets/files/Suras/${widget.sura.id}.txt');
    response = response.trim();
    var versesNo = response.split("\n") ;
    for(int i =0 ; i < versesNo.length ; i++){
      content = "$content [ ${i+1} ] ${versesNo[i]}" ;
    }
    content = content.trim();
     setState(() {

    });
}
}
