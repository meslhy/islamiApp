import 'package:flutter/material.dart';
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
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }



  Widget buildBottomNavigationBar() =>Theme(
    data: ThemeData().copyWith(canvasColor: AppColors.primary),
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      iconSize: 32,
      selectedFontSize: 20,
      selectedItemColor: AppColors.Accent,
      selectedLabelStyle: TextStyle(color: AppColors.Accent),
      items: [
        BottomNavigationBarItem(
          icon:InkWell(
            onTap: (){
              currentIndex = 0;
              setState(() {});
            },
            child: ImageIcon(
              AssetImage(AppAssets.icQuran),
            ),
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon:InkWell(
            onTap: (){
              currentIndex = 1;
              setState(() {});
            },
            child: ImageIcon(
              AssetImage(AppAssets.ichadeth),
            ),
          ),
          label: "Hadeth",
        ),
        BottomNavigationBarItem(
          icon:InkWell(
            onTap: (){
              currentIndex = 2;
              setState(() {});
            },
            child: ImageIcon(
              AssetImage(AppAssets.icSebha),
            ),
          ),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          icon:InkWell(
            onTap: (){
              currentIndex = 3;
              setState(() {});
            },
            child: ImageIcon(
              AssetImage(AppAssets.icRadio),
            ),
          ),
          label: "Radio",
        ),
      ],
    ),
  );
}
