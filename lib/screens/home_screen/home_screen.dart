import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home rote";


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon:IconButton(
                onPressed: (){
                  currentIndex =0;
                  setState(() {});
                },
                 icon:Icon(Icons.add) ,
                color: Colors.black,
              ),
              label: "hi",
          ),
          BottomNavigationBarItem(
              icon:IconButton(
                onPressed: (){
                  currentIndex =1;
                  setState(() {});
                },
                 icon:Icon(Icons.add) ,
                color: Colors.black,
              ),
              label: "hi",
          ),
          BottomNavigationBarItem(
              icon:IconButton(
                onPressed: (){
                  currentIndex =2;
                  setState(() {});
                },
                 icon:Icon(Icons.add) ,
                color: Colors.black,
              ),
              label: "hi",
          ),
        ],
      ),
    );
  }
}
