import 'package:flutter/material.dart';
import 'package:islami_route/shared_locale/helper.dart';

class SettingsProvider extends ChangeNotifier{
  String currentLocale = sharedPrefernce.getData(key: "isAR")? "ar":"en";
  ThemeMode mode =sharedPrefernce.getData(key: "isDark")?ThemeMode.dark: ThemeMode.light;

  void setCurrentMode(ThemeMode newMode){
    mode = newMode;
    notifyListeners();
  }
  bool isDarkEnabled() => mode == ThemeMode.dark;


  void setCurrentLocale(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }
  bool isArabicLocale() => currentLocale == "ar" ;
}