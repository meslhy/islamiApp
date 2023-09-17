import 'package:flutter/material.dart';
import 'package:islami_route/ui/screens/home_screen/home_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/sepha_screen/sepha_screen.dart';
import 'package:islami_route/ui/screens/sura_details/sura_details_screen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(context) =>  HomeScreen(),
        SebhaScreen.routeName :(context) =>  SebhaScreen(),
        SuraDetailsScreen.routeName :(context) => SuraDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
