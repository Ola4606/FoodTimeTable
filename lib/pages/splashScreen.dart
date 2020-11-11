import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruithero/model/user.dart';
import 'package:fruithero/services/auth.dart';
import 'package:fruithero/wrapper.dart';
import 'package:provider/provider.dart';
//import 'package:shimmer/shimmer.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
            (status) {
          if (status) {
            _navigateToHome();
          } 
          // else {
          //   _navigateToLogin();
          // }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 4000), () {});

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => 
                 StreamProvider<User>.value(
                    value: AuthService().user,
                            child: MaterialApp(
                              debugShowCheckedModeBanner: false,
                                home: Wrapper(),
      ),
    ),
            
        )
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.greenAccent[400],
          child: Stack(

            children: <Widget>[
          Container(
             margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
             child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                   child: CircleAvatar(
                     backgroundImage:  AssetImage('assets/images/diets.png'),
                     radius: 78,
                     backgroundColor: Colors.white,
                      ),
                   ),
                   //SizedBox(height: 15,),
           Padding(
             padding: const EdgeInsets.only(top :8.0),
             child: Text(
                    "Food Time",
                     textScaleFactor : 1,
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: 'Comic',

                    ),
                  ),
           ),
                
                 Container(
                 margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),   
                   child: Column(
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only( top :18.0),
                         child: Text(
                            '"Get the best ',
                             textScaleFactor : 1,
                            style: TextStyle(
                         color: Colors.white,
                           fontSize: 20.0,
                           fontFamily: 'Comic',

                            ),
                ),
                       ),
                 Text(
                          'food timetable',
                           textScaleFactor : 1,
                          style: TextStyle(
                       color: Colors.white,
                         fontSize: 20.0,
                         fontFamily: 'Comic',

                          ),
                ),
                Text(
                          'for the whole family"',
                           textScaleFactor : 1,
                          style: TextStyle(
                       color: Colors.white,
                         fontSize: 20.0,
                         fontFamily: 'Comic',

                          ),
                ),
                     ],
                   ),
                 ),
              ],
            ),
          ),
        ),
             
            ],
          ),
        ),
    );
  }


}