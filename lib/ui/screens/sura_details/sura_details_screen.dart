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
  String fileContent = "";
  late SuraDetailsArguments arg;

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    if(fileContent.isEmpty)readFile();

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
              arg.isQuranFile? "سوره "+arg.suraName : "",
            style: AppTheme.appBArTitleTextStyle,
          ),
          centerTitle: true,
          backgroundColor: AppColors.Transparent,
        ),
        body:fileContent.isEmpty?
        Center(
            child: CircularProgressIndicator(),
        ) :
        Container(
          margin: EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height * .8,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.White,
            borderRadius: BorderRadius.circular(25),
          ),
          child:  SingleChildScrollView(
            child: Text(
              fileContent,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void readFile() async {
    fileContent = await rootBundle.loadString("assets/files/${arg.isQuranFile
        ? "quran" : "ahadeth"}/${arg.fileName}");
    List<String> fileLines = fileContent.split("\n");
    for(int i = 0; i < fileLines.length; i++){
      fileLines[i] += arg.isQuranFile ? " (${i+1}) ": "";
    }
    fileContent = fileLines.join("");
    setState(() {});
  }
}
