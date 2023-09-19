import 'package:flutter/material.dart';
import 'package:islami_route/model/sura_details_arguments.dart';
import 'package:islami_route/ui/screens/sura_details/sura_details_screen.dart';

import '../../../../../utils/app_colors.dart';
List<String> nameOfSura = ["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

Widget buildSuraNAmeItems(BuildContext context , int index , bool isQuran) =>InkWell(
  onTap: (){
    Navigator.pushNamed(
        context,
        SuraDetailsScreen.routeName ,
      arguments:SuraDetailsArguments(fileName:isQuran? "${index+1}.txt" : "h${index+1}.txt" ,suraName: nameOfSura[index] , isQuranFile: isQuran ) ,
         );
  },
  child:Text(

 isQuran ?  nameOfSura[index] : "حديث${index+1}",

  textAlign: TextAlign.center,

  style: TextStyle(

  color: AppColors.Accent,

  fontWeight: FontWeight.bold,

  fontSize: 25,

  ),

  ),
);


