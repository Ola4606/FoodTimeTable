import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fruithero/pages/ingredientsPage.dart';
import 'package:fruithero/pages/myHome.dart';
import 'package:fruithero/pages/settingsPage.dart';
import 'dart:ui' as ui;


class BottomNavbar extends StatefulWidget {

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
      Home(),
      Ingredients(),
      Settings()
  ];

  void onTappedBar (int index) {
         setState(() {
            _currentIndex = index;
         });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap : onTappedBar,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.greenAccent[400],
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 400),
        index: 0,
        height: 52,
        items: <Widget>[

           ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return ui.Gradient.linear(
                Offset(4.0, 24.0),
                Offset(24.0, 4.0),
                [
                Colors.greenAccent[200],
                Colors.green[900],
                ],
              );
            },
            child: Icon(Icons.fastfood ,size: 30,),
           ),
           ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return ui.Gradient.linear(
                Offset(4.0, 24.0),
                Offset(24.0, 4.0),
                [
               Colors.greenAccent,
                Colors.green[900],
               ],
              );
            },
            child: Icon(Icons.format_list_bulleted, size: 30,),
          ),
         ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return ui.Gradient.linear(
                Offset(4.0, 24.0),
                Offset(24.0, 4.0),
                [
                Colors.greenAccent,
                Colors.green[900],
               ],
              );
            },
            child: Icon(Icons.settings, size: 30,),
          
         )
        ],
       
      ),
    );
  }
}



