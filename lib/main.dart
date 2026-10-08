 import 'package:flutter/material.dart';
import 'package:islamy/screens/home_screen.dart';
import 'package:islamy/screens/intro_screen.dart';

void main() {
  runApp(const myApp());
 }

 class myApp extends StatelessWidget {
   const myApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       initialRoute: IntroScreen.routeName,
       routes: {
         IntroScreen.routeName: (_) =>  IntroScreen(),
         HomeScreen.routeName: (_) =>  HomeScreen(),
       },
     );
   }
 }
