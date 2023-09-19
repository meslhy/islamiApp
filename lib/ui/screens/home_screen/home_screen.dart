import 'package:flutter/material.dart';
import 'package:islami_route/providers/settings_provider.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/ahadeth/ahadeth_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/quran/quran_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/radio/radio_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/sepha_screen/sepha_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/settings/settings_screen.dart';
import 'package:islami_route/ui/utils/app_assets.dart';
import 'package:islami_route/ui/utils/app_colors.dart';
import 'package:islami_route/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home rote";


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SettingsProvider settingsProvider ;
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranScreen(),
    AhadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.DefaultBackGround,),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              AppLocalizations.of(context)!.islami,
            style:AppTheme.appBArTitleTextStyle ,
          ),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: buildBottomNavigationBar(context),
      ),
    );
  }



  Widget buildBottomNavigationBar(BuildContext context) =>Theme(
    data:Theme.of(context).copyWith(
      canvasColor: settingsProvider.isDarkEnabled()?
          AppColors.primiaryDark : AppColors.primary,
    ),
    child: BottomNavigationBar(
      selectedIconTheme: IconThemeData(
        color: settingsProvider.isDarkEnabled()? AppColors.yellow : AppColors.Accent,
        size: 32,
      ),
      selectedFontSize: 18,
      currentIndex: currentIndex,
      onTap: (index){
        currentIndex = index;
        setState(() {});
      } ,
      items: [
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage(AppAssets.icQuran),
          ),
          label: AppLocalizations.of(context)!.quran,
        ),
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage(AppAssets.ichadeth),
          ),
          label: AppLocalizations.of(context)!.ahadeth,
        ),
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage(AppAssets.icSebha),
          ),
          label:AppLocalizations.of(context)!.sebha,
        ),
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage(AppAssets.icRadio),
          ),
          label: AppLocalizations.of(context)!.radio,
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.settings),
          label: AppLocalizations.of(context)!.settings,
        ),
      ],
    ),
  );
}
