import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_route/model/sura_details_arguments.dart';
import 'package:islami_route/ui/utils/app_assets.dart';
import 'package:islami_route/ui/utils/app_colors.dart';
import 'package:islami_route/ui/utils/app_theme.dart';


class SuraDetailsScreen extends StatefulWidget {

  static String routeName = "Sura Details Screen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> suraContent = [];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    if(suraContent.isEmpty)readSuraFile(arg.fileName);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.DefaultBackGround),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        backgroundColor: AppColors.Transparent,
        appBar: AppBar(
          elevation: 0.00,
          title: Text(
               "سوره "+arg.suraName,
            style: AppTheme.appBArTitleTextStyle,
          ),
          centerTitle: true,
          backgroundColor: AppColors.Transparent,
        ),
        body:suraContent.isEmpty?
        Center(
            child: CircularProgressIndicator(),
        ) :
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal:30,
              vertical:100,
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.White,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView.separated(
              itemBuilder:(context, index) => Text(
                "${suraContent[index]} ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              separatorBuilder: (context, index) => Column(
              children: [
                Text(
                textAlign: TextAlign.center,
                "(${index+1})",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
                SizedBox(height: 3,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: AppColors.primary,
                    height: 3,
                    thickness: 1,
                  ),
                ),
              ],
              ),
              itemCount: suraContent.length,
            ),
          ),
        ),
      ),
    );
  }

  readSuraFile(String fileName)async{
    var content =await rootBundle.loadString("assets/files/$fileName");

    suraContent = content.trim().split("\n");
    setState(() {});
  }
}
