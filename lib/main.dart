 import 'package:flutter/material.dart';
import 'package:islamy/models/sura.dart';
import 'package:islamy/screens/home/home_screen.dart';
import 'package:islamy/screens/intro_screen.dart';
import 'package:islamy/screens/sura_screen.dart';

void main() {
  runApp(const myApp());
 }

 class myApp extends StatelessWidget {
   const myApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       initialRoute: HomeScreen.routeName,
       routes: {
         IntroScreen.routeName: (_) =>  IntroScreen(),
         HomeScreen.routeName: (_) =>  HomeScreen(),
         SuraScreen.routeName:(context){
           var sura = ModalRoute.of(context)?.settings.arguments as Sura ;
               return SuraScreen(sura: sura) ;
         }
       },
     );
   }
 }
