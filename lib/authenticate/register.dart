import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:fruithero/pages/Loading.dart';
import 'package:fruithero/pages/offline.dart';
//import 'package:fruithero/pages/myHome.dart';
import 'package:fruithero/services/auth.dart';
import 'package:fruithero/shared/constants.dart';
import 'package:fruithero/shared/curvedBar.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

 
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';
  dynamic nickName = '';
  bool loading = false;

   

  @override
  Widget build(BuildContext context) {
    
     final AuthService _auth = AuthService(nickNamesofUser: nickName);
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.greenAccent[400],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          child: Text(
            'Registration Page',
             textScaleFactor : 1,
             style: TextStyle(
               fontSize: 24
             ),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
              child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 0
          ),
          child: Center(
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0,  MediaQuery.of(context).size.height * 0.03),
              child: Text(
                   'Please Fill The Forms',
                    textScaleFactor : 1,
                   style: TextStyle(
                      fontFamily: 'Comic',
                      color: Colors.white,
                      fontSize: 23,
              ),
                  ),
                      ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Nickname'),
                        validator: (val) => val.length < 3 || val.length > 10 ?
                         "Can't be less than 3 letters or more than 10" : null,
                        onChanged: (val) {
                          setState(() => nickName = val);
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Password'),
                        obscureText: true,
                        validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                       Text(
                        error,
                         textScaleFactor : 1,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      Container(
                        height: 60,
                        width: 270,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.white,
                           ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text(
                            'Register',
                             textScaleFactor : 1,
                            style: TextStyle(
                              color: Colors.greenAccent[400],
                              fontSize: 20.0,
                              fontFamily: 'Comic'
                              ),
                          ),
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                                  setState(() {
                                     loading = true;
                                  });
                              dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                              if(result == null) {
                                setState(() {
                                  error = 'Please supply a valid email';
                                });
                                
                                Navigator.push(context, 
                                   MaterialPageRoute(builder: (context) => Offline(error: error,)));
                                   setState(() {
                                     loading = false;
                                  });
                              }
                              else{
                                
                                Navigator.pushReplacement(context, 
                                   MaterialPageRoute(builder: (context) => BottomNavbar()));
                                   setState(() {
                                     loading = false;
                                  });
                              }
                            }
                          }
                        ),
                      ),
                      // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      // FlatButton(
                      //             onPressed: () {
                      //               widget.toggleView();
                      //             },
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(top :12.0),
                      //             child: Text(
                      //                 "Already have An Account?",
                      //                 style: TextStyle(
                      //                     fontSize: 20.0,
                      //                     fontFamily: 'Comic',
                      //                     color: Colors.greenAccent[400]),
                      //               ),
                      //           ),
                      //           ),
                     
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}