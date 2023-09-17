import 'package:flutter/material.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/ahadeth/ahadeth_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/quran/quran_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/radio/radio_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/sepha_screen/sepha_screen.dart';
import 'package:islami_route/ui/utils/app_assets.dart';
import 'package:islami_route/ui/utils/app_colors.dart';
import 'package:islami_route/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home rote";


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranScreen(),
    AhadethScreen(),
    SebhaScreen(),
    RadioScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.DefaultBackGround,),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.Transparent,
        appBar: AppBar(
          backgroundColor: AppColors.Transparent,
          elevation: 0.00,
          centerTitle:true,
          title: Text(
              "Eslami",
            style:AppTheme.appBArTitleTextStyle ,
          ),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }



  Widget buildBottomNavigationBar() =>Theme(
    data: ThemeData().copyWith(canvasColor: AppColors.primary),
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        currentIndex = index;
        setState(() {});
      } ,
      iconSize: 32,
      selectedFontSize: 20,
      selectedItemColor: AppColors.Accent,
      selectedLabelStyle: TextStyle(color: AppColors.Accent),
      items: [
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage(AppAssets.icQuran),
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage(AppAssets.ichadeth),
          ),
          label: "Hadeth",
        ),
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage(AppAssets.icSebha),
          ),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage(AppAssets.icRadio),
          ),
          label: "Radio",
        ),
      ],
    ),
  );
}
