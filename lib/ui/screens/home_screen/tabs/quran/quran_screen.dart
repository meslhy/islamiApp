import 'package:flutter/material.dart';
import 'package:islami_route/ui/screens/home_screen/tabs/quran/widgets/all.dart';
import 'package:islami_route/ui/utils/app_assets.dart';
import 'package:islami_route/ui/utils/app_colors.dart';

class QuranScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
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
            const Divider(
              height: 3,
                thickness: 3,
              color: AppColors.primary,
            ),
            const SizedBox(
              height: 4,

            ),

            const Text(
                "Sura Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.Accent,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 4,

            ),
            const Divider(
              height: 3,
              thickness: 3,
              color: AppColors.primary,
            ),

            Expanded(
              flex: 65,
                child:ListView.separated(
                    itemBuilder: (context, index) => buildSuraNAmeItems(context , index) ,
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.primary,
                      height: 3,
                      thickness: 1,
                    ),
                    itemCount: nameOfSura.length,
                ) ,
            ),
          ],
        ),
    );
  }
}
