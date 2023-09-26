import 'package:flutter/material.dart';
import 'package:islami_route/providers/settings_provider.dart';
import 'package:islami_route/shared_locale/helper.dart';
import 'package:islami_route/ui/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_route/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';
class SettingScreen extends StatefulWidget {

  static String routeName = "settingsRoute";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late bool isDark ;
  late bool isAr  ;
  late SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);
    isDark = settingsProvider.isDarkEnabled();
    isAr = settingsProvider.isArabicLocale();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Enable arabic(العربيه)", style:Theme.of(context).textTheme.bodySmall,),
            Switch(
              value: isAr,
              onChanged: (newValue){
              isAr = newValue;
              if(isAr){
                settingsProvider.setCurrentLocale("ar");
                sharedPrefernce.putData(key: "isAR", value: true);
              }else {
                settingsProvider.setCurrentLocale("en");
                sharedPrefernce.putData(key: "isAR", value: false);
              }
            }, activeColor:settingsProvider.isDarkEnabled()? AppColors.yellow : AppColors.primary,
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Dark mode",  style:Theme.of(context).textTheme.bodySmall,),
            Switch(
              value: isDark,
              onChanged: (newValue){
              isDark = newValue;
              if(isDark){
                settingsProvider.setCurrentMode(ThemeMode.dark);
                sharedPrefernce.putData(key: "isDark", value: isDark);
              }else {
                settingsProvider.setCurrentMode(ThemeMode.light);
                sharedPrefernce.putData(key: "isDark", value: isDark);

              }
            }, activeColor: AppColors.yellow,
            ),
          ],
        ),

      ],
    );
  }
}
