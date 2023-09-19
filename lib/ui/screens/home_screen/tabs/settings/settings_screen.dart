import 'package:flutter/material.dart';
import 'package:islami_route/providers/settings_provider.dart';
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
  bool isDark = false;
  bool isAr = false ;
  Key dark =Key("swetshDark");

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Enable arabic(العربيه)", style: AppTheme.settingsOptionTextStyle,),
            Switch(
              value: isAr,
              onChanged: (newValue){
              isAr = newValue;
              if(isAr){
                settingsProvider.setCurrentLocale("ar");
              }else {
                settingsProvider.setCurrentLocale("en");
              }
            }, activeColor: AppColors.primary,
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Dark mode",  style: AppTheme.settingsOptionTextStyle),
            Switch(
              value: isDark,
              onChanged: (newValue){
              isDark = newValue;
              if(isDark){
                settingsProvider.setCurrentMode(ThemeMode.dark);
              }else {
                settingsProvider.setCurrentMode(ThemeMode.light);
              }
            }, activeColor: AppColors.primary,
            ),
          ],
        ),

      ],
    );
  }
}
