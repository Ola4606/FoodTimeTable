import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:fruithero/pages/Loading.dart';
import 'package:fruithero/services/admobService.dart';
import 'package:fruithero/services/auth.dart';


class Settings extends StatefulWidget {
  final test;
  Settings({this.test});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final ams = AdMobService();
  final _auth = AuthService();
   bool loading = false;
  
  @override
  void initState() {
    super.initState();
    Admob.initialize('ca-app-pub-3016156260808797~6647076621');
  }
  @override
  Widget build(BuildContext context) {
   
    return loading ? Loading() : Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 30, 0, 10),
        child: Row(
        children: <Widget>[
          Text(
            'Settings',
             textScaleFactor : 1,
             style: TextStyle(
               fontSize: 20
             ),
            ),
          Icon(Icons.settings),
         ],
        )
      ),
      AdmobBanner(
        adUnitId: 'ca-app-pub-3016156260808797/9994654069',
        adSize: AdmobBannerSize.BANNER,
         
         ),
         Container(
           margin: EdgeInsets.only(top: 20),
           child: FlatButton(
             onPressed: () async {
               setState(() {
                 loading = true;
               });
                    await _auth.signOut();
                    setState(() {
                 loading = false;
               });
                  },
             
              child: Text(
                'Log Out',
                 textScaleFactor : 1,
                 style: TextStyle(
                   fontSize: 20,
                 ),
              )),
         ),
          
       
      ],
    );
  }
}