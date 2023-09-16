import 'package:flutter/material.dart';


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
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image:DecorationImage(
                image: AssetImage(
                  "assets/images/default_bg.png",
                ),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                    "assets/images/head_sebha.png"
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
                    onLongPress: (){
                      print("Done");
                    },
                    child: Transform.rotate(
                      angle: rotationAngle *(-3.14159265359/180),
                      child: Image.asset(
                          "assets/images/body_sebha.png"
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Text(
              "عدد التسبيحات",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 26,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xffbda384),
                  borderRadius: BorderRadius.circular(15)
              ),

              child: Text(
                "$counter",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 22,),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Color(0xFFB7935F),
                  borderRadius: BorderRadius.circular(35)
              ),

              child: Text(
                "${allText[indexOfAllText]}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
