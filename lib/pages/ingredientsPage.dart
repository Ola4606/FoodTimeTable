import 'package:flutter/material.dart';


class Ingredients extends StatefulWidget {
  @override
  _IngredientsState createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.greenAccent[400],
     body: Container(
       margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
       child: Column(
         children: <Widget>[
                       Align(
                         alignment: Alignment.topLeft,
                        child: Text('Ingredients:',
                         textScaleFactor : 1,
                         style: TextStyle(
                           fontSize: 40,
                           fontFamily: 'Comic',
                           color: Colors.white
                         )
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(2, 20, 0, 12),
                         child: Text('These are the items you would need for the next two weeks:',
                          textScaleFactor : 1,
                         style: TextStyle(
                           fontSize: 20,
                           fontFamily: 'Comic',
                           color: Colors.white
                         )
                         ),
                       ),
         ],
       ),
     ),
    );
  }
}