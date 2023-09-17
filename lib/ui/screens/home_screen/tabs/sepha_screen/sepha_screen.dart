import 'package:flutter/material.dart';
import 'package:islami_route/ui/utils/app_assets.dart';
import 'package:islami_route/ui/utils/app_colors.dart';


class SebhaScreen extends StatefulWidget {
  static String routeName = "sebha route";

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {

  double rotationAngle = 0.0;
  int counter = 0;
  List<String> allText =[
    "سبحان الله",
    "الحمد الله",
    "الله اكبر",
    "لا اله الا الله",
    "استغفرالله العلي العظيم",
    "اللهم صلي علي سيدنا محمد",
  ];

  int indexOfAllText =0;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
                AppAssets.HeadSebhaLogoDefault
            ),
            Container(
              height:370,
              child: GestureDetector(
                onTap: (){
                  rotationAngle += 45;
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
                  angle: rotationAngle *(-3.14159265359/180),
                  child: Image.asset(
                      AppAssets.BodySebhaLogoDefault
                  ),
                ),
              ),
            ),
          ],
        ),

        Text(
          "عدد التسبيحات",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 26,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15)
          ),

          child: Text(
            "$counter",
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(height: 22,),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(35)
          ),

          child: Text(
            "${allText[indexOfAllText]}",
            style: TextStyle(
              color: AppColors.White,
              fontSize: 25,
            ),
          ),
        ),
      ],
    );
  }
}
