import 'package:flutter/material.dart';
import 'package:islami_route/providers/settings_provider.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/widgets/all.dart';
import 'package:islami_route/ui/utils/app_assets.dart';
import 'package:islami_route/ui/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranScreen extends StatelessWidget {

  late SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 35,
          child: Image.asset(
              AppAssets.QuranScreenLogo
          ),
        ),
        const SizedBox(
          height: 8,

        ),

        Divider(
          height: 3,
            thickness: 3,
          color: settingsProvider.isDarkEnabled()? AppColors.yellow: AppColors.primary,
        ),
        const SizedBox(
          height: 4,

        ),
         Text(
          AppLocalizations.of(context)!.suraName,
          textAlign: TextAlign.center,
           style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 4,

        ),
         Divider(
          height: 3,
          thickness: 3,
          color: settingsProvider.isDarkEnabled()? AppColors.yellow: AppColors.primary,
        ),

        Expanded(
          flex: 65,
            child:ListView.separated(
                itemBuilder: (context, index) => buildSuraNAmeItems(context , index , true) ,
                separatorBuilder: (context, index) => const Divider(
                  height: 3,
                  thickness: 1,
                ),
                itemCount: nameOfSura.length,
            ) ,
        ),
      ],
    );
  }
}
