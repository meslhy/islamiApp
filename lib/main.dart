import 'package:flutter/material.dart';
import 'package:islami_route/providers/settings_provider.dart';
import 'package:islami_route/shared_locale/helper.dart';
import 'package:islami_route/ui/screens/home_screen/home_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/sepha_screen/sepha_screen.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/settings/settings_screen.dart';
import 'package:islami_route/ui/screens/sura_details/sura_details_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_route/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefernce.init();
  print(sharedPrefernce.getData(key:"isDark"));
  runApp( ChangeNotifierProvider(
    create:(_) => SettingsProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider settingsProvider ;

  @override
  Widget build(BuildContext context) {

    settingsProvider = Provider.of(context);


    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale:Locale(settingsProvider.currentLocale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: sharedPrefernce.getData(key: "isDark") ? ThemeMode.dark : ThemeMode.light,
      routes: {
        HomeScreen.routeName :(context) =>  HomeScreen(),
        SebhaScreen.routeName :(context) =>  SebhaScreen(),
        SuraDetailsScreen.routeName :(context) => SuraDetailsScreen(),
        SettingScreen.routeName :(context) => SettingScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
