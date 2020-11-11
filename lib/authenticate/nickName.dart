import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:fruithero/Animation/delayed_animation_reflectly.dart';
import 'package:fruithero/authenticate/register.dart';



void main() {
     runApp(Reflectly());
}
  
  
    
  class Reflectly extends StatefulWidget {

  final Function toggleView;
  Reflectly({this.toggleView});
  @override
  _ReflectlyState createState() => _ReflectlyState();
}

class _ReflectlyState extends State<Reflectly> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.greenAccent[400],
          body: SingleChildScrollView(
                      child: Center(
                        child: Container(
                          child: Column(
                            
                            children: <Widget>[
                              AvatarGlow(
                                endRadius: 90,
                                duration: Duration(seconds: 2),
                                glowColor: Colors.white24,
                                repeat: true,
                                repeatPauseDuration: Duration(seconds: 2),
                                startDelay: Duration(seconds: 1),
                                child: Material(
                                    elevation: 8.0,
                                    shape: CircleBorder(),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey[100],
                                      backgroundImage: AssetImage('assets/images/diets.png'),
                                      radius: 50.0,
                                    )),
                              ),
                              DelayedAnimation(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom :12.0),
                                  child: Text(
                                    "Hello",
                                     textScaleFactor : 1,
                                    style: TextStyle(
                                        fontFamily: 'Comic',
                                        fontSize: 35.0,
                                        color: color),
                                  ),
                                ),
                                delay: delayedAmount + 1000,
                              ),
                              DelayedAnimation(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom :18.0),
                                  child: Text(
                                    "Welcome To FoodTime",
                                     textScaleFactor : 1,
                                    style: TextStyle(
                                        fontFamily: 'Comic',
                                        fontSize: 29.0,
                                        color: color),
                                  ),
                                ),
                                delay: delayedAmount + 2000,
                              ),
                              // SizedBox(
                              //   height: 30.0,
                              // ),
                              DelayedAnimation(
                                child: Text(
                                  "Are you ready",
                                   textScaleFactor : 1,
                                  style: TextStyle(
                                    fontFamily: 'Comic',
                                    fontSize: 20.0,
                                     color: color),
                                ),
                                delay: delayedAmount + 3000,
                              ),
                              DelayedAnimation(
                                child: Text(
                                  "To never worry about what to",
                                   textScaleFactor : 1,
                                  style: TextStyle(
                                    fontFamily: 'Comic',
                                    fontSize: 20.0,
                                     color: color),
                                ),
                                delay: delayedAmount + 4000,
                              ),
                              DelayedAnimation(
                                child: Text(
                                  "cook",
                                   textScaleFactor : 1,
                                  style: TextStyle(
                                    fontFamily: 'Comic',
                                    fontSize: 20.0,
                                     color: color),
                                ),
                                delay: delayedAmount + 5000,
                              ),
                              DelayedAnimation(
                                child: Text(
                                  "And what to buy in the market",
                                   textScaleFactor : 1,
                                  style: TextStyle(
                                    fontFamily: 'Comic',
                                    fontSize: 20.0,
                                     color: color),
                                ),
                                delay: delayedAmount + 4000,
                              ),
                              DelayedAnimation(
                                child: Text(
                                  "each week?",
                                   textScaleFactor : 1,
                                  style: TextStyle(
                                    fontFamily: 'Comic',
                                    fontSize: 20.0,
                                     color: color),
                                ),
                                delay: delayedAmount + 5000,
                              ),
                              // SizedBox(
                              //   height: 100.0,
                              // ),
                              DelayedAnimation(
                              child: GestureDetector(
                                onTapDown: _onTapDown,
                                onTapUp: _onTapUp,
                                child: Transform.scale(
                                  scale: _scale,
                                  child: _animatedButtonUI,
                                ),
                              ),
                              delay: delayedAmount + 5000,
                            ),
                           // SizedBox(height: 20.0,),
                              DelayedAnimation(
                                child: FlatButton(
                                  onPressed: () {
                                    widget.toggleView();
                                  },
                                child: Padding(
                                  padding: const EdgeInsets.only(top :12.0),
                                  child: Text(
                                      "Already have An Account?",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Comic',
                                          color: color),
                                    ),
                                ),
                                ),
                                delay: delayedAmount + 5000,
                              ),
                            ],
                          ),
                        ),
                      ),
          )
          
          ),
    );
  }

  Widget get _animatedButtonUI => Container(
     margin: EdgeInsets.only(top : MediaQuery.of(context).size.height * 0.18),
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: RaisedButton(
          color: Colors.white,
          onPressed: () => Navigator.push(
    context, 
    MaterialPageRoute(builder: (context) => Register())),
                  child: Center(
            child: Text(
              'Register',
               textScaleFactor : 1,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Comic',
                color: Colors.greenAccent[400]
              ),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}


