import 'package:flutter/material.dart';
import 'package:islami_route/providers/settings_provider.dart';
import 'package:islami_route/ui/utils/app_assets.dart';
import 'package:islami_route/ui/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class SebhaScreen extends StatefulWidget {
  static String routeName = "sebha route";

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {

  double rotationAngle = 0.0;
  int counter = 0;
  List<String> allText =[
    "سُبْحَانَ اللَّهِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّ",
    "سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ",

    "لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ.",
    "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ",
    "الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَِ",
    "الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّدِ",
    "أستغفر الله ِ",
    "الْلَّهُ أَكْبَرُِ",
    "لَا إِلَهَ إِلَّا اللَّهُِ",
  ];
  late SettingsProvider settingsProvider ;


  int indexOfAllText =0;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: (){
              rotationAngle += 10;
              counter++;
              if(counter % 30 ==0)
              {
                indexOfAllText++;
                if(indexOfAllText ==allText.length)
                {
                  indexOfAllText=0;
                }
              }
              setState(() {});
            },
            child: Transform.rotate(
              angle: rotationAngle *(3.14159265359/180),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                     settingsProvider.isDarkEnabled()? AppAssets.HeadSebhaLogoDark : AppAssets.HeadSebhaLogoDefault
                  ),
                  Container(
                    height:370,
                      child: Image.asset(
                         settingsProvider.isDarkEnabled()? AppAssets.BodySebhaLogoDark: AppAssets.BodySebhaLogoDefault
                      ),
                  ),
                ],
              ),
            ),
          ),

          Text(
           AppLocalizations.of(context)!.numberOfPraises,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 26,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
            decoration: BoxDecoration(
                color:settingsProvider.isDarkEnabled()?AppColors.darkBlue : AppColors.primary,
                borderRadius: BorderRadius.circular(15)
            ),

            child: Text(
              "$counter",
              style: TextStyle(
                color: settingsProvider.isDarkEnabled()? AppColors.White : AppColors.Accent,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 22,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color:settingsProvider.isDarkEnabled()?AppColors.yellow:  AppColors.primary,
                borderRadius: BorderRadius.circular(35)
            ),

            child: Text(
              "${allText[indexOfAllText]}",
              style: TextStyle(
                color:settingsProvider.isDarkEnabled()? AppColors.primiaryDark: AppColors.White,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
